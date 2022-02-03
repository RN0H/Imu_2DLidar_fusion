#!/home/rohan/projects/3py/bin/python3

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc 


import rospy
import ros_numpy
from sensor_msgs.msg import PointCloud2 as pcl2
import numpy as np
from sklearn.neighbors import NearestNeighbors






def best_fit_transform(A, B):
    '''
    Calculates the least-squares best-fit transform that maps corresponding points A to B in m spatial dimensions
    Input:
      A: Nxm numpy array of corresponding points
      B: Nxm numpy array of corresponding points
    Returns:
      T: (m+1)x(m+1) homogeneous transformation matrix that maps A on to B
      R: mxm rotation matrix
      t: mx1 translation vector
    '''

    assert A.shape == B.shape

    # get number of dimensions
    m = A.shape[1]

    # translate points to their centroids
    centroid_A = np.mean(A, axis=0)
    centroid_B = np.mean(B, axis=0)
    AA = A - centroid_A
    BB = B - centroid_B

    # rotation matrix
    H = np.dot(AA.T, BB)
    U, S, Vt = np.linalg.svd(H)
    R = np.dot(Vt.T, U.T)

    # special reflection case
    if np.linalg.det(R) < 0:
       Vt[m-1,:] *= -1
       R = np.dot(Vt.T, U.T)

    # translation
    t = centroid_B.T - np.dot(R,centroid_A.T)

    # homogeneous transformation
    T = np.identity(m+1)
    T[:m, :m] = R
    T[:m, m] = t

    return T, R, t


def nearest_neighbor(src, dst):
    '''
    Find the nearest (Euclidean) neighbor in dst for each point in src
    Input:
        src: Nxm array of points
        dst: Nxm array of points
    Output:
        distances: Euclidean distances of the nearest neighbor
        indices: dst indices of the nearest neighbor
    '''

    assert src.shape == dst.shape

    neigh = NearestNeighbors(n_neighbors=1)
    neigh.fit(dst)
    distances, indices = neigh.kneighbors(src, return_distance=True)
    return distances.ravel(), indices.ravel()

def ndt():

    '''

    1] set cell size.

    2] Consider A & B as previous and current scan

    2] implement a hash_map A  with keys as cell number
       such that it contains at least 3 PointClouds. 

    3] for each cell in the hash_map A:

            a) Find mean(mu) of the PointClouds in it.

            b) Find the covariance(sigma) of the PointClouds in it.

            c) Find its  A[cell number] = (mu, sigma)

    4]  centroid_A = np.mean(A, axis=0)
        centroid_B = np.mean(B, axis=0)
        AA = A - centroid_A
        BB = B - centroid_B

        # rotation matrix
        H = np.dot(AA.T, BB)
        U, S, Vt = np.linalg.svd(H)
        R = np.dot(Vt.T, U.T)

        # special reflection case
        if np.linalg.det(R) < 0:
           Vt[m-1,:] *= -1
           R = np.dot(Vt.T, U.T)

        # translation
        t = centroid_B.T - np.dot(R,centroid_A.T)

        # homogeneous transformation
        T = np.identity(m+1)
        T[:m, :m] = R
        T[:m, m] = t


    5] For each PointCloud in B:

            Score+=  P.D.F(*A[Cell number], T*PointCLoud)

    6] If Score < optimal:

            set B as T*PointCLoud and goto 4

       else:
            return T


    '''
    




def icp(A, B, init_pose=None, max_iterations=20, tolerance=0.001):
    '''
    The Iterative Closest Point method: finds best-fit transform that maps points A on to points B
    Input:
        A: Nxm numpy array of source mD points
        B: Nxm numpy array of destination mD point
        init_pose: (m+1)x(m+1) homogeneous transformation
        max_iterations: exit algorithm after max_iterations
        tolerance: convergence criteria
    Output:
        T: final homogeneous transformation that maps A on to B
        distances: Euclidean distances (errors) of the nearest neighbor
        i: number of iterations to converge
    '''

    a = A.shape
    b = B.shape
    if a!=b:
        if a[0]>b[0]:
            A = A[:b[0],:]
        else:
            B = B[:a[0],:]

    # get number of dimensions
    m = A.shape[1]

    # make points homogeneous, copy them to maintain the originals
    src = np.ones((m+1,A.shape[0]))
    dst = np.ones((m+1,B.shape[0]))
    src[:m,:] = np.copy(A.T)
    dst[:m,:] = np.copy(B.T)

    # apply the initial pose estimation
    if init_pose is not None:
        src = np.dot(init_pose, src)
    prev_error = 0

    for i in range(max_iterations):
        # find the nearest neighbors between the current source and destination points
        distances, indices = nearest_neighbor(src[:m,:].T, dst[:m,:].T)

        # compute the transformation between the current source and nearest destination points
        T,_,_ = best_fit_transform(src[:m,:].T, dst[:m,indices].T)

        # update the current source
        src = np.dot(T, src)

        # check error
        mean_error = np.mean(distances)
        if np.abs(prev_error - mean_error) < tolerance:break
            
        prev_error = mean_error

    # calculate final transformation
    T,_,_ = best_fit_transform(A, src[:m,:].T)

    return T, distances, i



l = []
def callback(data):
    l.append(ros_numpy.point_cloud2.pointcloud2_to_xyz_array(data))
    if len(l)==2:
        print(icp(l[0], l[1]))
        l.pop(0)

if __name__ == "__main__":
    try:
        rospy.init_node("NDTICP")
        rospy.Subscriber("pcl2",pcl2,callback)
        rospy.spin()
    except rospy.ROSInterruptException:
              pass