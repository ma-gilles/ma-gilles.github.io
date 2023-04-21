import numpy as np

# Try to implement householder!
def householder_triangularization(A):
    _,n = A.shape
    R = np.copy(A) # Store temporary vectors into Q.
    V = [] # Store v's into this list
    for k in range(n):
        # Column k, entries on and below the diagonal
        x = R[k:,k] 
        # v = sign(x[0]) e_1 \|x\| + x
        v = x.copy() 
        v[0] += np.sign(v[0]) * np.linalg.norm(x)
        # Normalize:
        v = v / np.linalg.norm(v)
        # Update (2,2) block of matrix:
        R[k:,k:] = R[k:,k:] - 2 * np.outer(v,  v.T @ R[k:,k:])

        # Store v in V:
        V.append(v)
    
    return V, R

def apply_Q_to_vector(V, x):
    # Computes b = Q @ x, where Q is defined implicitely by the Householder reflectors in V
    n = len(V)
    b = x.copy()
    for k in reversed(range(n)):
        b[k:] = b[k:] - 2 * V[k] * (V[k].T @ b[k:])
    return b

def form_Q_matrix(V):
    m = V[0].size
    I = np.eye(m)
    Q = np.zeros((m,m))
    for k in range(m):
        Q[:,k] = apply_Q_to_vector(V,I[:,k])
    return Q
