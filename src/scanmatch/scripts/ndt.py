from collections import defaultdict
from math import sin, cos
import math
import numpy as np


class NDT:

    def __init__(self, A, B, cellsize ,population, iterations, tolerance , odometry):
        self.A = A              #A = [[x, y, z], ...]
        self.B = B[::40]              #B = [[x, y, z], ...]
        self.N = iterations     #Number of runs
        self.E = tolerance      #feasible score
        self.C = max(cellsize,1)       #grid cell size
        self.P = population
                             #odometry
        self.T = odometry
        self.hashmap_A = defaultdict(list)

    def Distribute(self):
        '''
        Set cell size  

        Initializes hashmap A

        Implement a hash_map A  with keys as cell number        ###~~~~ TBD
        such that it contains at least 3 PointClouds


        '''
    
        for x, y, z in self.A:
            self.hashmap_A["{}{}".format(int(math.floor((x-self.C)/self.C)), int(math.floor((y-self.C)/self.C)))].append([x,y])
       
        xmean,ymean,sx,sy= 0,0,[],[]  
       
        '''

        Use the hash_map A and calculate mean and covariance within each cell
        and replace PointCloud values with it.

         for each cell in the hash_map A:

            a) Find mean(mu) of the PointClouds in it.

            b) Find the covariance(sigma) of the PointClouds in it.

            c) Find its  A[cell number] = (mu, sigma)

        '''
        self.grids = defaultdict(lambda :False)
        for k,v in self.hashmap_A.items():
            if len(v)>=self.P:

                for i in v:
                    sx.append(i[0])
                    sy.append(i[1])
                l = len(v)
       
                xmean = np.mean(sx)
                ymean = np.mean(sy)
                xsigma = (sx-xmean).dot(sx-xmean)/l + 1e-7
                ysigma = (sy-ymean).dot(sy-ymean)/l + 1e-7
                self.grids[k] = ([[xmean, ymean] ,
                                 [[1/xsigma,1/ysigma]]])
                sx = []
                sy = []
        
        return self


    def Pdf(self, u, s, x):
      

        self.invs = np.multiply(np.array(s),np.eye(2))
       
        self.q_invs = -(x - u).dot(self.invs)
        #print((x-u))
        self.q_invs_qt =   self.q_invs.dot((x - u).T)
       
        self.summand = np.exp(self.q_invs_qt/2)
        return self

    def Jacobian(self, x, y):
    
        self.j = np.array([[1,0, -x*self.si-y*self.co],
                           [0,1,  x*self.co-y*self.si]])  
        #print(self.q_invs.shape)
        self.q_invs_j =  self.q_invs.dot(self.j)
        #print(self.q_invs_j.shape)
        self.J = -self.q_invs_j.dot(self.summand)

        return self

    def Hessian(self, x, y):
       
        o = np.array([[0.0],[0.0]])
        dj = np.array([[-x*self.co + y*self.si], [-x*self.si - y*self.co]])
        h = np.array([[  o, o, o ],
                      [  o, o, o ],
                      [  o, o, dj ]])
       # h = np.array([[-x*self.co + y*self.si], [-x*self.si - y*self.co]])

        self.H =np.eye(3)*1e-2-self.summand*(self.q_invs_j.dot(self.q_invs_j) + self.q_invs.dot(h) - self.j.T.dot(self.invs).dot(self.j))
       
       
        #print((self.j.T.dot(self.invs).dot(self.j)).shape, 'asd')

        #print(self.q_invs.dot(h).shape)
        #print("----")
        return self

       

    def transform(self, tx, ty, m, xyz):
        '''

        T = |R t|.|x y z 1|.T
            |0 1|

        '''
        self.si = np.sin(m)
        self.co = np.cos(m)
        T = np.array([[self.co, -self.si,  tx ],
                      [self.si,  self.co,  ty ],      #input transform
                      [0.0    ,   0.0   ,   1]])
        self.xyz = np.dot(T,xyz.T)
        return self


    def Score(self):
       
        t = []

        grids = self.Distribute().grids

        for _ in range(self.N):
            '''
            Set initial score as 0 for next iteration
            Transform the scan according to inital/previous estimate
            '''
            score = 0
            self.B= self.transform(self.T[0], self.T[1], self.T[2], self.B).xyz.T
           
            '''
            Iterate over the PointClouds
            NOTE: If the number of PointClouds vary beyond 1000;
                  utilization of numpy for dealing with massive overheads
                  is prudent for low execution
            '''

            for x,y,z in self.B:
                #start = timeit.default_timer()

                '''
                Check which cell does the PointCloud lie in
                '''

                key_frame = "{}{}".format(int(math.floor((x-self.C)/self.C)), int(math.floor((y-self.C)/self.C)))
                   
                if key_frame in grids:
                    '''
                    1] Extract the mean and covarianve found in the key
                   
                    2]calculate the summand and add it to the score and check

                    3] calculate JH^-1... J = Jacobian Matrix; H = Hessian Matrix

                    '''
                    u, s = grids[key_frame]

                    s = self.Pdf(u, s, np.array([x,y])).summand

                    score+= s
                    
                    
                    t.append(self.Jacobian(x,y).J.dot(np.linalg.inv(self.Hessian(x,y).H)))
                #print("pclloop-------------{}ms".format(1e3*(timeit.default_timer()-start)))
            if score > self.E:
                '''
                If feasible return the transformation matrix
                '''
                return self.T
            else:
                '''
                If not calculate the mean value of the JH-1 list
                and subtract it with the transformation parameter
               
                pk+1 = pk - JH^-1
                '''
                
                self.T-= sum(np.mean(i, axis = 0) for i in t)/max(len(t),1)
                t = []
        return self.T