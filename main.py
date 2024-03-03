from math import log, exp


def get_empty_list(count: int) -> list:
    return [0 for _ in range(count)]


def get_empty_matrix(height: int, width: int) -> list:
    return [[0 for j in range(width)] for i in range(height)]


element_name = 'Питан'
k = 28
k_count = k + 1
p = 14

k0 = [0.1586, 0.0912, 0.157, 0.165, 0.0945, 0.2375]
m = [0, 92, 94, 95, 96, 97, 98, 100]
# k0 = [0.0085, 0.00016, 1.5e-9, 0.0035]
k0 = [0, *k0]
k0_amount = sum(k0)
# m = [235, 234, 232, 236, 238]
m = [0, *m]
count_m = len(m)
f = 1.3

xi = get_empty_matrix(count_m, 201)
cp = get_empty_matrix(count_m, 201)
cm = get_empty_matrix(count_m, 201)
c = get_empty_matrix(count_m, 201)
ll = get_empty_matrix(count_m, 201)
l = get_empty_matrix(count_m, 201)
fi = get_empty_matrix(count_m, 201)

ccm = get_empty_matrix(count_m, k_count)
ccp = get_empty_matrix(count_m, k_count)
cc = get_empty_matrix(count_m, k_count)

gp = get_empty_list(k_count)
gm = get_empty_list(k_count)
g = get_empty_list(k_count)
tet = get_empty_list(k_count)
sig = get_empty_list(k_count)

ggm = get_empty_list(k_count)
ggp = get_empty_list(k_count)
gg = get_empty_list(k_count)
a = get_empty_list(count_m)

for i in range(1, k):
    xi[4][i] = f
    for j in range(1, count_m):
        xi[j][i] = exp((m[7] - m[j]) / (m[7] - m[1]) * log(xi[4][i]))

# for i in range(1, count_m - 1):
#     print(F'xi{i}=', xi[i][1], F'eps{i}={log(xi[i][1])}')

# _________________________
"""
f1=sqrt(xi[5,1])
for i in range (1;k-1):
   f2=xi[5,1]/f1
   sig[i]={(f2-1)/f2/(f1-1)}0.2973
   {f1=f2}
f1=sqrt(xi[3,1])
for i=k:
   f2=xi[3,1]/f1;
   sig[i]={(f2-1)/f2/(f1-1)}0.2973

"""

f1 = xi[5][1] ** 0.5
for i in range(1, k - 1):
    f2 = xi[5][1] / f1
    sig[i] = (f2 - 1) / f2 / (f1 - 1)
    f1 = f2
f1 = xi[3][1] ** 2
f2 = xi[3][1] / f1

sig[k] = (f2 - 1) / f2 / (f1 - 1)
# _________________________
"""
for i=1 to k :
          begin
             fi[1,i]=sig[i]*xi[1,i]/(1+sig[i]*xi[1,i]);
             fi[7,i]=sig[i]/(1+sig[i]); fi[2,i]=sig[i]*xi[2,i]/(1+sig[i]*xi[2,i]);
             fi[4,i]=sig[i]*xi[4,i]/(1+sig[i]*xi[4,i]);
             fi[3,i]=sig[i]*xi[3,i]/(1+sig[i]*xi[3,i]);
             fi[5,i]=sig[i]*xi[5,i]/(1+sig[i]*xi[5,i]);
             fi[6,i]=sig[i]*xi[6,i]/(1+sig[i]*xi[6,i]);
"""
for i in range(1, k):
    for j in range(1, count_m):
        fi[j][i] = sig[i] * xi[j][1] / (1 + sig[i] * xi[j][1])

for i in range(1, count_m):
    fi[-1][i] = sig[i] / (1 + sig[i])

# _________________________

for i in range(1, count_m):
    ll[i][1] = 1

"""
for i=1 to k:
        begin
           l[1,i]=fi[1,i]/(1-fi[1,i]);  l[2,i]=fi[2,i]/(1-fi[2,i]);
           l[3,i]=fi[3,i]/(1-fi[3,i]);  l[4,i]=fi[4,i]/(1-fi[4,i]);
           l[5,i]=fi[5,i]/(1-fi[5,i]);  l[6,i]=fi[6,i]/(1-fi[6,i]);
           l[7,i]=fi[7,i]/(1-fi[7,i]);
"""
for i in range(1, k):
    for j in range(1, count_m):
        l[j][i] = fi[j][i] / (1 - fi[j][i])

for i in range(1, count_m):
    print(f'l{i}={l[i]}')

"""
for i=1 to k :
   ll[1,1]=ll[1,1]*l[1,i];  
   ll[2,1]=ll[2,1]*l[2,i];
   ll[3,1]=ll[3,1]*l[3,i];  
   ll[4,1]=ll[4,1]*l[4,i];
   ll[5,1]=ll[5,1]*l[5,i];  
   ll[6,1]=ll[6,1]*l[6,i];
   ll[7,1]=ll[7,1]*l[7,i];
"""
for i in range(1, k):
    for j in range(1, count_m):
        ll[j][1] = ll[j][1] * l[j][i]

"""
for i=2 to k:
    ll[1, i] = ll[1, i - 1] / l[1, i - 1];
    ll[2, i] = ll[2, i - 1] / l[2, i - 1];
    ll[3, i] = ll[3, i - 1] / l[3, i - 1];
    ll[4, i] = ll[4, i - 1] / l[4, i - 1];
    ll[5, i] = ll[5, i - 1] / l[5, i - 1];
    ll[6, i] = ll[6, i - 1] / l[6, i - 1];
    ll[7, i] = ll[7, i - 1] / l[7, i - 1];
"""
for i in range(2, k):
    for j in range(1, count_m):
        ll[j][i] = ll[j][i - 1] / l[j][i - 1]

