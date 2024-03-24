from math import log, exp


def get_empty_list(count: int) -> list:
    return [0 for _ in range(count)]


def get_empty_matrix(height: int, width: int) -> list:
    return [[0 for j in range(width)] for i in range(height)]


element_name = 'Питан'
k = 70
count_k = k + 1
p = 38
fs = 0
fs1 = 0
fs2 = 0
nn = p
jp = nn
sg = 0
k0 = [0.1586, 0.0912, 0.157, 0.165, 0.0945, 0.2375]
m = [92, 94, 95, 96, 97, 98, 100]
# k0 = [0.0085, 0.00016, 1.5e-9, 0.0035]
k0 = [0, *k0]
k0_amount = sum(k0)
# m = [235, 234, 232, 236, 238]
m = [0, *m]
count_m = len(m)

xi = get_empty_matrix(count_m, 201)
cp = get_empty_matrix(count_m, 201)
cm = get_empty_matrix(count_m, 201)
c = get_empty_matrix(count_m, 201)
ll = get_empty_matrix(count_m, 201)
l = get_empty_matrix(count_m, 201)
fi = get_empty_matrix(count_m, 201)

ccm = get_empty_matrix(count_m, count_k)
ccp = get_empty_matrix(count_m, count_k)
cc = get_empty_matrix(count_m, count_k)
k_zero = get_empty_matrix(count_m, 201)

gp = get_empty_list(count_k)
gm = get_empty_list(count_k)
g = get_empty_list(count_k)
tet = get_empty_list(count_k)
sig = get_empty_list(count_k)
T0 = get_empty_list(count_k)
TM = get_empty_list(count_k)
TP = get_empty_list(count_k)
ggm = get_empty_list(count_k)
ggp = get_empty_list(count_k)
gg = get_empty_list(count_k)
a = get_empty_list(count_m)
f1 = 0
f = 0
f_fun = get_empty_list(count_k)
ff_fun = get_empty_list(count_m)
fmin = 0


def xis():
    for i in range(1, k):
        for j in range(1, count_m):
            xi[j][i] = exp((m[7] - m[j]) / (m[7] - m[4]) * log(2))
            xi[4][i] = 2

    for i in range(1, count_m - 2):
        print(F"xi{i}1={xi[i][1]}")


def ras():
    global f1
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

    f1 = 1
    f2 = 1
    f3 = 1
    f74 = 1
    f75 = 1
    f76 = 1
    f78 = 1

    for i in range(1, k):
        f1 = f1 + ll[1][i]
        f2 = f2 + ll[2][i]
        f3 = f3 + ll[3][i]
        f74 = f74 + ll[4][i]
        f75 = f75 + ll[5][i]
        f76 = f76 + ll[6][i]
        f78 = f78 + ll[7][i]

    for ip in range(1, k):
        f11 = 1
        f22 = 1
        f33 = 1
        f44 = 1
        f55 = 1
        f66 = 1
        f77 = 1

        f11 = f11 + ll[1][ip + 1]
        f22 = f22 + ll[2][ip + 1]
        f33 = f33 + ll[3][ip + 1]
        f44 = f44 + ll[4][ip + 1]
        f55 = f55 + ll[5][ip + 1]
        f66 = f66 + ll[6][ip + 1]
        f77 = f77 + ll[7][ip + 1]

        f4 = f4 + (T0[ip] * k_zero[1][ip] - TM[ip + 1] * ccm[1][ip + 1] - TP[ip - 1] * ccp[1][ip - 1]) * f11
        f5 = f5 + (T0[ip] * k_zero[2][ip] - TM[ip + 1] * ccm[2][ip + 1] - TP[ip - 1] * ccp[2][ip - 1]) * f22
        f6 = f6 + (T0[ip] * k_zero[3][ip] - TM[ip + 1] * ccm[3][ip + 1] - TP[ip - 1] * ccp[3][ip - 1]) * f33
        f7 = f7 + (T0[ip] * k_zero[4][ip] - TM[ip + 1] * ccm[4][ip + 1] - TP[ip - 1] * ccp[4][ip - 1]) * f44
        f8 = f8 + (T0[ip] * k_zero[5][ip] - TM[ip + 1] * ccm[5][ip + 1] - TP[ip - 1] * ccp[5][ip - 1]) * f55
        f9 = f9 + (T0[ip] * k_zero[6][ip] - TM[ip + 1] * ccm[6][ip + 1] - TP[ip - 1] * ccp[6][ip - 1]) * f66
        f10 = f10 + (T0[ip] * (
                1 - k_zero[1][ip] - k_zero[2][ip] - k_zero[3][ip] - k_zero[4][ip] - k_zero[5][ip] - k_zero[6][ip]) -
                     TM[ip + 1] * (
                             1 - ccm[1][ip + 1] - ccm[2][ip + 1] - ccm[3][ip + 1] - ccm[4][ip + 1] - ccm[5][ip + 1] -
                             ccm[6][ip + 1]) - TP[ip - 1] * (
                                 1 - ccp[1][ip - 1] - ccp[2][ip - 1] - ccp[3][ip - 1] - ccp[4][ip - 1] - ccp[5][ip - 1] - ccp[6][ip - 1])) * f77


def iterx(gz):
    T0[1], T0[k], jj = 0, 0, 0
    ras()
    for i in range(1, count_m):
        k_zero[i][1] = cm[i][1]
        k_zero[i][k] = cm[i][k]

    if gz > gm[2]:
        T0[1] = gz - gm[2]
    else:
        T0[1] = 0
    if gz > gp[k - 1]:
        T0[k] = gz - gp[k - 1]
    else:
        T0[k] = 0
    bl2 = False
    ras()
    if gz > gm[2]:
        T0[1] = gz - gm[2]
    else:
        T0[1] = 0
    if gz > gp[k - 1]:
        T0[k] = gz - gp[k - 1]
    else:
        T0[k] = 0
    for j in range(1, count_m):
        k_zero[j][1] = (cm[j][1] + k_zero[j][1]) / 2
        k_zero[j][k] = (cm[j][k] + k_zero[j][k]) / 2
    jj += 1
    bl2 = True
    for j in range(1, count_m):
        bl2 = bl2 and abs(cm[j][1] - k_zero[j][1]) < 1e-9
        bl2 = bl2 and abs(cm[j][k] - k_zero[j][k]) < 1e-9
    while bl2 or (jj > 500):
        ras()
        if gz > gm[2]:
            T0[1] = gz - gm[2]
        else:
            T0[1] = 0
        if gz > gp[k - 1]:
            T0[k] = gz - gp[k - 1]
        else:
            T0[k] = 0
        for j in range(1, count_m):
            k_zero[j][1] = (cm[j][1] + k_zero[j][1]) / 2
            k_zero[j][k] = (cm[j][k] + k_zero[j][k]) / 2
        jj += 1
        bl2 = True
        for j in range(1, count_m):
            bl2 = bl2 and abs(cm[j][1] - k_zero[j][1]) < 1e-9
            bl2 = bl2 and abs(cm[j][k] - k_zero[j][k]) < 1e-9
    if jj > 500:
        Bl = True
    else:
        Bl = False


def pech():
    f1 = T - T0[k];
    f2 = T11 - T0[1];
    print(' Gzak[1]= ', T0[1]: 14:10, ' Gzak[k]= ', T0[k]: 14:10);
    print('  T= ', f1: 14:10, ' T11= ', f2: 14:10, ' TM= ', TM[jn]: 14:10, ' TP= ', TP[nn]: 14:10);

    print(' cm[1,1]= ', cm[1, 1]: 22:19, ' cp[1,k]= ', cp[1, k]: 22:19);
    print(' cm[2,1]= ', cm[2, 1]: 22:19, ' cp[2,k]= ', cp[2, k]: 22:19);
    print(' cm[3,1]= ', cm[3, 1]: 22:19, ' cp[3,k]= ', cp[3, k]: 22:19);
    print(' cm[4,1]= ', cm[4, 1]: 22:19, ' cp[4,k]= ', cp[4, k]: 22:19);
    print(' cm[5,1]= ', cm[5, 1]: 22:19, ' cp[5,k]= ', cp[5, k]: 22:19);
    print(' cm[6,1]= ', cm[6, 1]: 22:19, ' cp[6,k]= ', cp[6, k]: 22:19);
    print(' cm[7,1]= ', 1 - cm[1, 1] - cm[2, 1] - cm[3, 1] - cm[4, 1] - cm[5, 1] - cm[6, 1]: 22:19, ' cp[7,k]= ', 1 -
                                                                                                                  cp[
                                                                                                                      1, k] -
                                                                                                                  cp[
                                                                                                                      2, k] -
                                                                                                                  cp[
                                                                                                                      3, k] -
                                                                                                                  cp[
                                                                                                                      4, k] -
                                                                                                                  cp[
                                                                                                                      5, k] -
                                                                                                                  cp[
                                                                                                                      6, k]: 22:19);

    def sech():
        global fs
        fs = cm[1][1] * 0.061 + cm[2][1] * 0.339 + cm[3][1] * 13.6 + cm[4][1] * 0.447 + cm[5][1] * 2.49 + cm[6][
            1] * 0.132 + (1 - cm[1][1] - cm[2][1] - cm[3][1] - cm[4][1] - cm[5][1] - cm[6][1]) * 0.194

    def sech1():
        global fs1
        fs1 = cp[1][k] * 0.061 + cp[2][k] * 0.339 + cp[3][k] * 13.6 + cp[4][k] * 0.447 + cp[5][k] * 2.49 + cp[
            6][k] * 0.132 + (1 - cp[1][k] - cp[2][k] - cp[3][k] - cp[4][k] - cp[5][k] - cp[6][k]) * 0.194

    def sech2():
        global fs2
        fs2 = cp[1][jp] * 0.061 + cp[2][jp] * 0.339 + cp[3][jp] * 13.6 + cp[4][jp] * 0.447 + cp[5][jp] * 2.49 + cp[
            6][jp] * 0.132 + (1 - cp[1][jp] - cp[2][jp] - cp[3][jp] - cp[4][jp] - cp[5][jp] - cp[6][jp]) * 0.194

    def main():
        global f, sg, f1, fmin, fs, fs1, fs2
        T0[p] = 1
        for i in range(1, k):
            xi[4][i] = 2
            for j in range(1, count_m):
                if j == 4:
                    continue
                xi[j][i] = exp((m[7] - m[j]) / (m[7] - m[4]) * log(xi[4][i]))

        for i in range(1, count_m - 1):
            print(F"xi{i}1={xi[i][1]}")

        f1 = xi[5][1] ** 0.5
        for i in range(1, k - 1):
            f2 = xi[5][1] / f1
            sig[i] = 0.2973
        f1 = xi[3][1] ** 0.5
        f2 = xi[3][1] / f1
        sig[k] = 0.2973
        print(F' vvod {cp[1][k]}n, {cp[1][k]}v')
        gz = int(input("Введите gz: "))
        iz = int(input("Введите iz: "))
        iterx(gz)
        sech()
        sech1()
        sech2()
        print(F"sech T={fs1} sech T11 = {fs} sech TP={fs2}")

        for i in range(1, k):
            f += xi[4][i]
            print(f'sred xi[4,i]={f / k}')
        cmax = cp[iz][jp]
        print(f'cmax={cmax}: 12:9, nn={nn} ')
        pech()

        f = 0
        for i in range(1, k):
            f = f + g[i]
            sg = f
        print(f'sg= {sg}')
        print(f'sred g={f / k}')
        print(f'sig[1]={sig[1]}, sig[k]={sig[k]}')

        f1 = 0
        for i in range(1, k):
            f1 = f1 + (g[i] - gz) ** 0.5

        fmin = f1
        print(F"povtor calculation: Suma G = {f} nn={nn}, cp[iz,nn]= {cp[iz][nn]}")

        print(' chek max concentration')
        print(F"jp={jp} cmax={cp[iz][jp]} summa G={f}")

    if __name__ == "__main__":
        main()
