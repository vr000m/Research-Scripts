import math
from markov_loss import *
import numpy
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
import pylab

def plot(a, name):
    fig = plt.figure()
    ax = fig.add_subplot(111)
    bp = ax.boxplot( a )

    ax.set_xlabel('iterations')
    ax.set_ylabel('loss_rate')
    ax.set_ylim(0.0, 1.0)
    #plt.setp(bp['whiskers'], color='k',  linestyle='-' )
    #plt.setp(bp['fliers'], markersize=5.0)
    fig.subplots_adjust(right=0.99,top=0.99)
    #plt.show()
    pp = PdfPages(name+'.pdf')
    plt.savefig(pp, format='pdf')
    pp.close()

def main():
    RUNS=100
    PKT_CNT = 10000
    p_loss=[0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
    q_loss=[0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
    for p in p_loss:
        for q in q_loss:
            r=0
            a=[]
            while(r<RUNS):
                loss=0
                i=0
                while(i<PKT_CNT):
                    o=markov_loss(p,q)
                    if (o==False):
                        loss = loss +1
                    i = i+1
                lr=round(float(loss)/PKT_CNT,5)
                #print p, q, r, loss, PKT_CNT-loss, lr 
                a.insert(r, lr)
                r = r +1
                #endof while
            arr=numpy.array(a)
            avg = round(arr.mean(),2)
            std = round(arr.std(ddof = 1),2)
            var = round(arr.var(),2)
            print p, q, r, avg, std, var
            plot(a, str(p)+str(q))
main()