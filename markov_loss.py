import random

PREV_MARKOV_STATE=1

'''
    Two-state markov chain for packet loss
    p = probability of loss
    q = probability of no loss after loss
'''

def markov_loss(p,q):
    global PREV_MARKOV_STATE
    rand=random.uniform(0.0,1.0)
    #print rand
    if (PREV_MARKOV_STATE==1):
        if (rand<p):
            PREV_MARKOV_STATE = 0
            #packet lost
            return False
        else:
            #packet sent
            return True
    elif (PREV_MARKOV_STATE==0):
        if (rand<q):
            PREV_MARKOV_STATE = 1
            #packet sent
            return True
        else:
            #packet lost
            return False
