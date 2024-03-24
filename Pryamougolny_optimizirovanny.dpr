uses
SysUtils;

{R-cascade 2-3}
  type mas2 = array [1..6,0..200] of extended;
       mas3 = array [1..7,0..200] of extended;
       mas1 = array [0..200] of extended;
       mas4 = array [1..100,1..200] of extended;
       mas5 = array [1..100] of integer;
    var i,ii,i1,iss,ip,j,j1,j2,jn,jp,k,p,jj,nn,iz:integer;
        f,f1,f2,f3,f4,f5,f6,f44,f55,f66,f11,f22,f33,f111,f77,
        f7,f8,f74,f75,f84,f85,f76,f86,f9,f78,f87,f10,
        kp1,kp2,kp3,kp4,kp5,kp6,km1,km2,km3,km4,km5,km6,cmn,cmv,d,sg,sg1,ss,cz,sign,sigv,tpd,czw,czp,gz,czn,czv,
        T,T11,gn,gv,teta,m1,m2,m3,m4,m5,m6,m7,eu,bet1,bet2,bet3,r1,r2,r3,fun,cmax,fs,fs1,fs2,fmin,rsig:extended;
        ci,cn,cv,g,gp,gm,tet,ttet,tau1:mas1;
        rm,rp,r,sig,a,T0,TM,TP,ko1,ko2,ko3,ko4,ko5,ko6,x1,x2,xp,sx,hx,ssig,ssig1,ssig2,ssig3,ssig4,pfmin,n:mas1;
        cc,c,ccp,cp,ccm,cm,sm,sm1,sm2,sm3,sp,xi,xxi,taui1:mas2;
        fi,l,ll,T1,s:mas3;
        psig:mas4;
        no:mas5;
        bl,bl1,bl2:boolean;
  procedure sort(r:integer);
    var i,j,ii:integer;
    begin
       for i=1 to r : no[i]=i;
       for i=1 to r-1 :
        for j=i+1 to r : if pfmin[j]<pfmin[i] then
          begin
             {print(' i= ',i:4,' j= ',j:4, ' pfmin[i]= ',pfmin[i]:12:8, ' pfmin[j]= ',pfmin[j]:12:8); readln;}
             f=pfmin[i]; pfmin[i]=pfmin[j]; pfmin[j]=f;
             ii=i; no[i]=j; no[j]=ii;
             {print(' i= ',i:4,' j= ',j:4, ' pfmin[i]= ',pfmin[i]:12:8, ' pfmin[j]= ',pfmin[j]:12:8); readln;}
          end
    end;
  procedure sech;
    begin
       fs=cm[1,1]*0.061+cm[2,1]*0.339+cm[3,1]*13.6+cm[4,1]*0.447+cm[5,1]*2.49+cm[6,1]*0.132+
       (1-cm[1,1]-cm[2,1]-cm[3,1]-cm[4,1]-cm[5,1]-cm[6,1])*0.194;
    end;
  procedure sech1;
    begin
       fs1=cp[1,k]*0.061+cp[2,k]*0.339+cp[3,k]*13.6+cp[4,k]*0.447+cp[5,k]*2.49+cp[6,k]*0.132+
       (1-cp[1,k]-cp[2,k]-cp[3,k]-cp[4,k]-cp[5,k]-cp[6,k])*0.194;
    end;
  procedure sech2;
    begin
       fs2=cp[1,jp]*0.061+cp[2,jp]*0.339+cp[3,jp]*13.6+cp[4,jp]*0.447+cp[5,jp]*2.49+cp[6,jp]*0.132+
       (1-cp[1,jp]-cp[2,jp]-cp[3,jp]-cp[4,jp]-cp[5,jp]-cp[6,jp])*0.194;
    end;
  
  procedure xis;
    begin
       for i=1 to k :
         begin
           xi[1,i]=exp((m7-m1)/(m7-m4)*ln(xi[4,i]));
           xi[2,i]=exp((m7-m2)/(m7-m4)*ln(xi[4,i]));
           xi[3,i]=exp((m7-m3)/(m7-m4)*ln(xi[4,i]));
           xi[5,i]=exp((m7-m5)/(m7-m4)*ln(xi[4,i]));
           xi[6,i]=exp((m7-m6)/(m7-m4)*ln(xi[4,i]));
         end;
    end;
  

  procedure ras;
    begin
       for i=1 to k :
          begin
             fi[1,i]=sig[i]*xi[1,i]/(1+sig[i]*xi[1,i]);
             fi[2,i]=sig[i]*xi[2,i]/(1+sig[i]*xi[2,i]);
             fi[3,i]=sig[i]*xi[3,i]/(1+sig[i]*xi[3,i]);
             fi[4,i]=sig[i]*xi[4,i]/(1+sig[i]*xi[4,i]);
             fi[5,i]=sig[i]*xi[5,i]/(1+sig[i]*xi[5,i]);
             fi[6,i]=sig[i]*xi[6,i]/(1+sig[i]*xi[6,i]);
             fi[7,i]=sig[i]/(1+sig[i]);
          end;
       ll[1,1]=1; ll[2,1]=1; ll[3,1]=1;  ll[4,1]=1; ll[5,1]=1; ll[6,1]=1; ll[7,1]=1;
       for i=1 to k:
        begin
           l[1,i]=fi[1,i]/(1-fi[1,i]);
           l[2,i]=fi[2,i]/(1-fi[2,i]);
           l[3,i]=fi[3,i]/(1-fi[3,i]);
           l[4,i]=fi[4,i]/(1-fi[4,i]);
           l[5,i]=fi[5,i]/(1-fi[5,i]);
           l[6,i]=fi[6,i]/(1-fi[6,i]);
           l[7,i]=fi[7,i]/(1-fi[7,i]);
        end;
     for i=1 to k :
        begin
           ll[1,1]=ll[1,1]*l[1,i];
           ll[2,1]=ll[2,1]*l[2,i];
           ll[3,1]=ll[3,1]*l[3,i];
           ll[4,1]=ll[4,1]*l[4,i];
           ll[5,1]=ll[5,1]*l[5,i];
           ll[6,1]=ll[6,1]*l[6,i];
           ll[7,1]=ll[7,1]*l[7,i];
        end;
     for i=2 to k :
        begin
           ll[1,i]=ll[1,i-1]/l[1,i-1];
           ll[2,i]=ll[2,i-1]/l[2,i-1];
           ll[3,i]=ll[3,i-1]/l[3,i-1];
           ll[4,i]=ll[4,i-1]/l[4,i-1];
           ll[5,i]=ll[5,i-1]/l[5,i-1];
           ll[6,i]=ll[6,i-1]/l[6,i-1];
           ll[7,i]=ll[7,i-1]/l[7,i-1];
        end;
      {1 созвон тут закончили}
      f1=1; f2=1; f3=1;
      f74=1; f75=1; f76=1; f78=1;
     for i=1 to k:
        begin
           f1=f1+ll[1,i];
           f2=f2+ll[2,i];
           f3=f3+ll[3,i];
           f74=f74+ll[4,i];
           f75=f75+ll[5,i];
           f76=f76+ll[6,i];
           f78=f78+ll[7,i];
        end;
       f4=0; f5=0; f6=0; f7=0; f8=0; f9=0; f10=0;
     for ip=1 to k :
        begin
           f11=1; f22=1; f33=1; f44=1; f55=1; f66=1; f77=1;
           for i=ip+1 to k:
              begin
                 f11=f11+ll[1,i]; f22=f22+ll[2,i]; f33=f33+ll[3,i];
                 f44=f44+ll[4,i]; f55=f55+ll[5,i]; f66=f66+ll[6,i];
                 f77=f77+ll[7,i]
              end;
           f4=f4+(T0[ip]*ko1[ip]-TM[ip+1]*ccm[1,ip+1]-TP[ip-1]*ccp[1,ip-1])*f11;
           f5=f5+(T0[ip]*ko2[ip]-TM[ip+1]*ccm[2,ip+1]-TP[ip-1]*ccp[2,ip-1])*f22;
           f6=f6+(T0[ip]*ko3[ip]-TM[ip+1]*ccm[3,ip+1]-TP[ip-1]*ccp[3,ip-1])*f33;
           f7=f7+(T0[ip]*ko4[ip]-TM[ip+1]*ccm[4,ip+1]-TP[ip-1]*ccp[4,ip-1])*f44;
           f8=f8+(T0[ip]*ko5[ip]-TM[ip+1]*ccm[5,ip+1]-TP[ip-1]*ccp[5,ip-1])*f55;
           f9=f9+(T0[ip]*ko6[ip]-TM[ip+1]*ccm[6,ip+1]-TP[ip-1]*ccp[6,ip-1])*f66;
           f10=f10+(T0[ip]*(1-ko1[ip]-ko2[ip]-ko3[ip]-ko4[ip]-ko5[ip]-ko6[ip])-TM[ip+1]*(1-ccm[1,ip+1]-ccm[2,ip+1]-ccm[3,ip+1]-ccm[4,ip+1]-ccm[5,ip+1]-ccm[6,ip+1])
                -TP[ip-1]*(1-ccp[1,ip-1]-ccp[2,ip-1]-ccp[3,ip-1]-ccp[4,ip-1]-ccp[5,ip-1]-ccp[6,ip-1]))*f77;
        end;

# T1 - транзитный поток
# T0 - питание
# К0 - питание конц
   
     f4=f4/f1; f5=f5/f2; f6=f6/f3; f7=f7/f74; f8=f8/f75; f9=f9/f76; f10=f10/f78;
     f=f4+f5+f6+f7+f8+f9+f10; T11=f; cm[1,1]=f4/f; cm[2,1]=f5/f; cm[3,1]=f6/f; cm[4,1]=f7/f; cm[5,1]=f8/f; cm[6,1]=f9/f;
     T1[1,1]=f4; T1[2,1]=f5; T1[3,1]=f6; T1[4,1]=f7; T1[5,1]=f8; T1[6,1]=f9; T1[7,1]=f10;
     f1=0; f2=0; f3=0; f84=0; f85=0; f86=0; f87=0;
     for i=1 to k:
        begin
           if i>1 then
              begin
                 T1[1,i]=T1[1,i-1]-T0[i-1]*ko1[i-1]+TM[i]*ccm[1,i]+TP[i-2]*ccp[1,i-2];
                 T1[2,i]=T1[2,i-1]-T0[i-1]*ko2[i-1]+TM[i]*ccm[2,i]+TP[i-2]*ccp[2,i-2];
                 T1[3,i]=T1[3,i-1]-T0[i-1]*ko3[i-1]+TM[i]*ccm[3,i]+TP[i-2]*ccp[3,i-2];
                 T1[4,i]=T1[4,i-1]-T0[i-1]*ko4[i-1]+TM[i]*ccm[4,i]+TP[i-2]*ccp[4,i-2];
                 T1[5,i]=T1[5,i-1]-T0[i-1]*ko5[i-1]+TM[i]*ccm[5,i]+TP[i-2]*ccp[5,i-2];
                 T1[6,i]=T1[6,i-1]-T0[i-1]*ko6[i-1]+TM[i]*ccm[6,i]+TP[i-2]*ccp[6,i-2];
                 T1[7,i]=T1[7,i-1]-T0[i-1]*(1-ko1[i-1]-ko2[i-1]-ko3[i-1]-ko4[i-1]-ko5[i-1]-ko6[i-1])+TM[i]*(1-ccm[1,i]-ccm[2,i]-ccm[3,i]-ccm[4,i]-ccm[5,i]-ccm[6,i])
                        +TP[i-2]*(1-ccp[1,i-2]-ccp[2,i-2]-ccp[3,i-2]-ccp[4,i-2]-ccp[5,i-2]-ccp[6,i-2]);
              end;
           f1=f1+T0[i]*ko1[i]-TM[i]*ccm[1,i]-TP[i]*ccp[1,i];
           f2=f2+T0[i]*ko2[i]-TM[i]*ccm[2,i]-TP[i]*ccp[2,i];
           f3=f3+T0[i]*ko3[i]-TM[i]*ccm[3,i]-TP[i]*ccp[3,i];
           f84=f84+T0[i]*ko4[i]-TM[i]*ccm[4,i]-TP[i]*ccp[4,i];
           f85=f85+T0[i]*ko5[i]-TM[i]*ccm[5,i]-TP[i]*ccp[5,i];
           f86=f86+T0[i]*ko6[i]-TM[i]*ccm[6,i]-TP[i]*ccp[6,i];
           f87=f87+T0[i]*(1-ko1[i]-ko2[i]-ko3[i]-ko4[i]-ko5[i]-ko6[i])-TM[i]*(1-ccm[1,i]-ccm[2,i]-ccm[3,i]-ccm[4,i]-ccm[5,i]-ccm[6,i])
                -TP[i]*(1-ccp[1,i]-ccp[2,i]-ccp[3,i]-ccp[4,i]-ccp[5,i]-ccp[6,i])
        end;
     f4=f1-f4; f5=f2-f5; f6=f3-f6; f7=f84-f7; f8=f85-f8; f9=f86-f9; f10=f87-f10;
     {print(' f4= ',f4:12:7,' f5= ',f5:12:7,' f6= ',f6:12:7,' f7= ',f7:12:7,' f8= ',f8:12:7,' f9= ',f9:12:7,' f10= ',f10:12:7);}
     T=f4+f5+f6+f7+f8+f9+f10; cp[1,k]=f4/T; cp[2,k]=f5/T; cp[3,k]=f6/T; cp[4,k]=f7/T; cp[5,k]=f8/T; cp[6,k]=f9/T;
     km1=cm[1,1]; kp1=cp[1,k];
     km2=cm[2,1]; kp2=cp[2,k];
     km3=cm[3,1]; kp3=cp[3,k];
     km4=cm[4,1]; kp4=cp[4,k];
     km5=cm[5,1]; kp5=cp[5,k];
     km6=cm[6,1]; kp6=cp[6,k];

     for i=1 to k :
         begin
            f1=0; f2=0; f3=0; f4=0; f5=0; f6=0; f7=0;
            for j=1 to i :
               begin
                  f11=1; f22=1; f33=1; f44=1; f55=1; f66=1; f77=1;
                  for iss=j to i:
                     begin
                        f11=f11*fi[1,iss]/(1-fi[1,iss]);
                        f22=f22*fi[2,iss]/(1-fi[2,iss]);
                        f33=f33*fi[3,iss]/(1-fi[3,iss]);
                        f44=f44*fi[4,iss]/(1-fi[4,iss]);
                        f55=f55*fi[5,iss]/(1-fi[5,iss]);
                        f66=f66*fi[6,iss]/(1-fi[6,iss]);
                        f77=f77*fi[7,iss]/(1-fi[7,iss]);
                     end;
                  f1=f1+f11*T1[1,j]; f2=f2+f22*T1[2,j];
                  f3=f3+f33*T1[3,j]; f4=f4+f44*T1[4,j];
                  f5=f5+f55*T1[5,j]; f6=f6+f66*T1[6,j];
                  f7=f7+f77*T1[7,j];
               end;
            f1=f1/fi[1,i]; f2=f2/fi[2,i]; f3=f3/fi[3,i];
            f4=f4/fi[4,i]; f5=f5/fi[5,i]; f6=f6/fi[6,i]; f7=f7/fi[7,i];
            f=f1+f2+f3+f4+f5+f6+f7; g[i]=f;
            c[1,i]=f1/f; c[2,i]=f2/f; c[3,i]=f3/f; c[4,i]=f4/f; c[5,i]=f5/f; c[6,i]=f6/f;
            f11=fi[1,i]*f1; f22=fi[2,i]*f2; f33=fi[3,i]*f3;
            f44=fi[4,i]*f4; f55=fi[5,i]*f5; f66=fi[6,i]*f6; f77=fi[7,i]*f7;
            f=f11+f22+f33+f44+f55+f66+f77; gp[i]=f;
            cp[1,i]=f11/f; cp[2,i]=f22/f; cp[3,i]=f33/f; cp[4,i]=f44/f; cp[5,i]=f55/f; cp[6,i]=f66/f;

            f11=(1-fi[1,i])*f1; f22=(1-fi[2,i])*f2; f33=(1-fi[3,i])*f3;
            f44=(1-fi[4,i])*f4; f55=(1-fi[5,i])*f5; f66=(1-fi[6,i])*f6; f77=(1-fi[7,i])*f7;
            f=f11+f22+f33+f44+f55+f66+f77; gm[i]=f;
            cm[1,i]=f11/f; cm[2,i]=f22/f; cm[3,i]=f33/f; cm[4,i]=f44/f; cm[5,i]=f55/f; cm[6,i]=f66/f;

         end;
    {До сюдова идем}
    end;

    procedure iterx;
       var a0,a1,a2,a3:extended;
       b11,b12,b13,b14,b15,b16,b17,b18,b19,b100,b101,b102:boolean;
       jj:integer;
       begin
          Bl=false;
          ii=0;
          b11=false; b12=false; b13=false; b14=false; b15=false;
          b16=false; b17=false; b18=false; b19=false; b100=false;
          b101=false; b102=false;
          {print(' : Zak '); readln;}

gz- Заданный поток питания ступени

             T0[1]=0; T0[k]=0;
             jj=0;
             ras;
             ko1[1]=cm[1,1]; ko2[1]=cm[2,1]; ko3[1]=cm[3,1]; ko4[1]=cm[4,1]; ko5[1]=cm[5,1]; ko6[1]=cm[6,1];
             ko1[k]=cp[1,k]; ko2[k]=cp[2,k]; ko3[k]=cp[3,k]; ko4[k]=cp[4,k]; ko5[k]=cp[5,k]; ko6[k]=cp[6,k];
             if gz>gm[2] then T0[1]=gz-gm[2]else T0[1]=0;
             if gz>gp[k-1] then T0[k]=gz-gp[k-1]else T0[k]=0;
             bl2=false;
             repeat
                ras;
                if gz>gm[2] then T0[1]=gz-gm[2]else T0[1]=0; if gz>gp[k-1] then T0[k]=gz-gp[k-1]else T0[k]=0;
                ko1[1]=(cm[1,1]+ko1[1])/2; ko2[1]=(cm[2,1]+ko2[1])/2; ko3[1]=(cm[3,1]+ko3[1])/2;
                 ko4[1]=(cm[4,1]+ko4[1])/2; ko5[1]=(cm[5,1]+ko5[1])/2; ko6[1]=(cm[6,1]+ko6[1])/2;
                ko1[k]=(cp[1,k]+ko1[k])/2; ko2[k]=(cp[2,k]+ko2[k])/2; ko3[k]=(cp[3,k]+ko3[k])/2;
                 ko4[k]=(cp[4,k]+ko4[k])/2; ko5[k]=(cp[5,k]+ko5[k])/2; ko6[k]=(cp[6,k]+ko6[k])/2;
                jj=jj+1;
                bl2=(abs(cm[1,1]-ko1[1])<1e-9) and (abs(cm[2,1]-ko2[1])<1e-9) and (abs(cm[3,1]-ko3[1])<1e-9) and (abs(cm[4,1]-ko4[1])<1e-9)
                    and (abs(cm[5,1]-ko5[1])<1e-9) and (abs(cm[6,1]-ko6[1])<1e-9)and
                     (abs(cp[1,k]-ko1[k])<1e-9) and (abs(cp[2,k]-ko2[k])<1e-9) and (abs(cp[3,k]-ko3[k])<1e-9) and (abs(cp[4,k]-ko4[k])<1e-9)
                    and (abs(cp[5,k]-ko5[k])<1e-9) and (abs(cp[6,k]-ko6[k])<1e-9);

             until bl2 or (jj>500);
             if jj>500 then Bl=true else Bl=false;
             {print(' jj= ',jj:3); readln;}

       end;
    
     procedure pchel(var kl:integer; rsig:extended);
     var i,j,i1,ii,jj:integer;
     begin
        for i=1 to k : ssig[i]=sig[i];
        iterx; f=0; for i=1 to k : f=f+sqr(g[i]-gz);
        fmin=f;
        {print(' fmin= ',fmin:12:8); readln;}
        for i=1 to kl :
          begin
             psig[i,k]=ssig[k];
             for j=1 to k-1 :
                begin
                   psig[i,j]=ssig[j]+(ran:m-0.5)*rsig;
                   if psig[i,j]<0.02 then psig[i,j]=0.02;
                   if psig[i,j]>20 then psig[i,j]=20;
                end;

             for j=1 to k : sig[j]=psig[i,j];
             iterx;

             pfmin[i]=0; for i1=1 to k : pfmin[i]=pfmin[i]+sqr(g[i1]-gz);
             if (cp[1,k]<czn)or(cp[1,k]>czv) then Bl=true;
             if Bl then pfmin[i]=99999;
             {print(' i= ',i:4,' pfmin[i]= ',pfmin[i]:12:8); readln;}
          end;

        sort(kl);

        ii=no[1];
        {print(' pfmin[1]= ',pfmin[1]:12:8,' no[1]= ',no[1]:4); readln;}

        if pfmin[1]<fmin then
           begin
              for i=1 to k : ssig[i]=psig[ii,i];
              fmin=pfmin[1];
           end;
         jj=0;
     repeat

        jj=jj+1;
        {print(' jj= ',jj:4); readln;}
        ii=no[1]; for i=1 to k : ssig1[i]=psig[ii,i];
        ii=no[2]; for i=1 to k : ssig2[i]=psig[ii,i];
        ii=no[3]; for i=1 to k : ssig3[i]=psig[ii,i];
        ii=no[4]; for i=1 to k : ssig4[i]=psig[ii,i];
        for i=1 to kl :
          begin
             psig[i,k]=ssig[k];
             for j=1 to k-1 :
                begin
                   psig[i,j]=ssig1[j]+(ran:m-0.5)*rsig;
                   if psig[i,j]<0.02 then psig[i,j]=0.02;
                   if psig[i,j]>20 then psig[i,j]=20;
                end;
             for j=1 to k : sig[j]=psig[i,j];
             iterx;
             pfmin[i]=0; for i1=1 to k : pfmin[i]=pfmin[i]+sqr(g[i1]-gz);
            if (cp[1,k]<czn)or(cp[1,k]>czv) then Bl=true;
             if Bl then pfmin[i]=99999;
          end;
         for i=1 to kl :
          begin
             psig[kl+i,k]=ssig[k];
             for j=1 to k-1 :
                begin
                   psig[kl+i,j]=ssig2[j]+(ran:m-0.5)*rsig;
                   if psig[kl+i,j]<0.02 then psig[kl+i,j]=0.02;
                   if psig[kl+i,j]>20 then psig[kl+i,j]=20;
                end;
             for j=1 to k : sig[j]=psig[kl+i,j];
             iterx;
             pfmin[kl+i]=0; for i1=1 to k : pfmin[kl+i]=pfmin[kl+i]+sqr(g[i1]-gz);
             if (cp[1,k]<czn)or(cp[1,k]>czv) then Bl=true;
             if Bl then pfmin[kl+i]=99999;
          end;
          for i=1 to kl :
          begin
             psig[2*kl+i,k]=ssig[k];
             for j=1 to k-1 :
                begin
                   psig[2*kl+i,j]=ssig3[j]+(ran:m-0.5)*rsig;
                   if psig[2*kl+i,j]<0.02 then psig[2*kl+i,j]=0.02;
                   if psig[2*kl+i,j]>20 then psig[2*kl+i,j]=20;
                end;
             for j=1 to k : sig[j]=psig[2*kl+i,j];
             iterx;
             pfmin[2*kl+i]=0; for i1=1 to k : pfmin[2*kl+i]=pfmin[2*kl+i]+sqr(g[i1]-gz);
             if (cp[1,k]<czn)or(cp[1,k]>czv) then Bl=true;
             if Bl then pfmin[2*kl+i]=99999;
          end;
          for i=1 to kl :
          begin
             psig[3*kl+i,k]=ssig[k];
             for j=1 to k-1 :
                begin
                   psig[3*kl+i,j]=ssig4[j]+(ran:m-0.5)*rsig;
                   if psig[3*kl+i,j]<0.02 then psig[3*kl+i,j]=0.02;
                   if psig[3*kl+i,j]>20 then psig[3*kl+i,j]=20;
                end;
             for j=1 to k : sig[j]=psig[3*kl+i,j];
             iterx;
             pfmin[3*kl+i]=0; for i1=1 to k : pfmin[3*kl+i]=pfmin[3*kl+i]+sqr(g[i1]-gz);
             if (cp[1,k]<czn)or(cp[1,k]>czv) then Bl=true;
             if Bl then pfmin[3*kl+i]=99999;
          end;
        sort(4*kl);
        {for i=1 to 4*kl : print(' i= ',i:4,' pfmin[i]= ',pfmin[i]:12:8); readln;}
        if pfmin[1]<fmin then
           begin
              {for i=1 to k : ssig[i]=ssig1[i];} ii=no[1]; for i=1 to k : ssig[i]=psig[ii,i];
              fmin=pfmin[1];
           end;
        if (jj=50)or(jj=100)or(jj=150)or(jj=200)or(jj=250)or(jj=300)or(jj=350)or(jj=400)or(jj=450)or(jj=500)
             or(jj=550)or(jj=600)or(jj=650)or(jj=700) then
                 print(' jj= ',jj:4,' pfmin[1]= ',pfmin[1]:12:8,' cp[1,k]= ',cp[1,k]:10:7,' fmin= ',fmin:12:8);

        if (jj=100)or(jj=200)or(jj=300)or(jj=400)or(jj=500)or(jj=600)then rsig=rsig/2;
     until (jj>=700);

     end;

    
procedure pech;
   begin

     f1=T-T0[k]; f2=T11-T0[1];
     print(' Gzak[1]= ',T0[1]:14:10,' Gzak[k]= ',T0[k]:14:10);
     print('  T= ',f1:14:10,' T11= ',f2:14:10,' TM= ',TM[jn]:14:10,' TP= ',TP[nn]:14:10);

     print(' cm[1,1]= ',cm[1,1]:22:19,' cp[1,k]= ',cp[1,k]:22:19);
     print(' cm[2,1]= ',cm[2,1]:22:19,' cp[2,k]= ',cp[2,k]:22:19);
     print(' cm[3,1]= ',cm[3,1]:22:19,' cp[3,k]= ',cp[3,k]:22:19);
     print(' cm[4,1]= ',cm[4,1]:22:19,' cp[4,k]= ',cp[4,k]:22:19);
     print(' cm[5,1]= ',cm[5,1]:22:19,' cp[5,k]= ',cp[5,k]:22:19);
     print(' cm[6,1]= ',cm[6,1]:22:19,' cp[6,k]= ',cp[6,k]:22:19);
     print(' cm[7,1]= ',1-cm[1,1]-cm[2,1]-cm[3,1]-cm[4,1]-cm[5,1]-cm[6,1]:22:19,' cp[7,k]= ',1-cp[1,k]-cp[2,k]-cp[3,k]-cp[4,k]-cp[5,k]-cp[6,k]:22:19);
     print;

     print(' ko1[1]= ',ko1[1]:10:8,' cm[1,1]= ',cm[1,1]:10:8, ' ko2[1]= ',ko2[1]:10:8,' cm[2,1]= ',cm[2,1]:10:8);
     print(' ko3[1]= ',ko3[1]:10:8,' cm[3,1]= ',cm[3,1]:10:8, ' ko4[1]= ',ko4[1]:10:8,' cm[4,1]= ',cm[4,1]:10:8);
     print(' ko5[1]= ',ko5[1]:10:8,' cm[5,1]= ',cm[5,1]:10:8, ' ko6[1]= ',ko6[1]:10:8,' cm[6,1]= ',cm[6,1]:10:8);

     print(' ko1[k]= ',ko1[k]:10:8,' cp[1,k]= ',cp[1,k]:10:8, ' ko2[k]= ',ko2[k]:10:8,' cp[2,k]= ',cp[2,k]:10:8);
     print(' ko3[k]= ',ko3[k]:10:8,' cp[3,k]= ',cp[3,k]:10:8, ' ko4[k]= ',ko4[k]:10:8,' cp[4,k]= ',cp[4,k]:10:8);
     print(' ko5[k]= ',ko5[k]:10:8,' cp[5,k]= ',cp[5,k]:10:8, ' ko6[k]= ',ko6[k]:10:8,' cp[6,k]= ',cp[6,k]:10:8);

     f1=0; f2=0; f3=0; f84=0; f85=0; f86=0;
     for i=1 to k :
        begin
          f1=f1+T0[i]*ko1[i]; f2=f2+T0[i]*ko2[i];
          f3=f3+T0[i]*ko3[i]; f84=f84+T0[i]*ko4[i];  f85=f85+T0[i]*ko5[i]; f86=f86+T0[i]*ko6[i];
        end;
     f1=f1-T*cp[1,k]-T11*cm[1,1]; f2=f2-T*cp[2,k]-T11*cm[2,1];
     f3=f3-T*cp[3,k]-T11*cm[3,1]; f84=f84-T*cp[4,k]-T11*cm[4,1]; f85=f85-T*cp[5,k]-T11*cm[5,1];
     f86=f86-T*cp[6,k]-T11*cm[6,1];
     for i=1 to k :
        begin
           f1=f1-TM[i]*ccm[1,i]-TP[i]*ccp[1,i]; f2=f2-TM[i]*ccm[2,i]-TP[i]*ccp[2,i]; f3=f3-TM[i]*ccm[3,i]-TP[i]*ccp[3,i]; f84=f84-TM[i]*ccm[4,i]-TP[i]*ccp[4,i];
           f85=f85-TM[i]*ccm[5,i]-TP[i]*ccp[5,i]; f86=f86-TM[i]*ccm[6,i]-TP[i]*ccp[6,i];
        end;
     print('  Ў « ­бл Ї® 1-© - 4-© Є®¬Ї®­Ґ­в ¬:', f1:19:15,f2:19:15,f3:19:15,f84:19:15,f85:19:15,f86:19:15);
     print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;

     print(' а бзҐв Ї®в®Є®ў '); f22=0;
     for i=1 to k :
        begin
           g[i]=gp[i]+gm[i]; tet[i]=gp[i]/g[i]; f22=f22+g[i];
           print(' gm[',i:3,']= ',gm[i]:8:4,' gp[',i:3,']= ',gp[i]:8:4,' g[',i:3,']= ',g[i]:8:4,' tet[',i:3,']=',tet[i]:10:6);
           if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
              begin
                 print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
              end;
        end;
      print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
      print(' Ў « ­бл Ї® бвгЇҐ­п¬ *1e+10');
     for i=1 to k :
              begin
                 f1=T0[i]*ko1[i]-TM[i+1]*cm[1,i+1]-TP[i-1]*ccp[1,i-1]; f2=T0[i]*ko2[i]-TM[i+1]*cm[2,i+1]-TP[i-1]*ccp[2,i-1];
                 f3=T0[i]*ko3[i]-TM[i+1]*cm[3,i+1]-TP[i-1]*ccp[3,i-1]; f4=T0[i]*ko4[i]-TM[i+1]*cm[4,i+1]-TP[i-1]*ccp[4,i-1];
                 f5=T0[i]*ko5[i]-TM[i+1]*cm[5,i+1]-TP[i-1]*ccp[5,i-1]; f6=T0[i]*ko6[i]-TM[i+1]*cm[6,i+1]-TP[i-1]*ccp[6,i-1];
                 if i=1 then
                    begin
                       f1=f1+gm[2]*cm[1,2]-gp[1]*cp[1,1]-gm[1]*cm[1,1];
                       f2=f2+gm[2]*cm[2,2]-gp[1]*cp[2,1]-gm[1]*cm[2,1];
                       f3=f3+gm[2]*cm[3,2]-gp[1]*cp[3,1]-gm[1]*cm[3,1];
                       f4=f4+gm[2]*cm[4,2]-gp[1]*cp[4,1]-gm[1]*cm[4,1];
                       f5=f5+gm[2]*cm[5,2]-gp[1]*cp[5,1]-gm[1]*cm[5,1];
                       f6=f6+gm[2]*cm[6,2]-gp[1]*cp[6,1]-gm[1]*cm[6,1];
                    end;
                 if i=k then
                    begin
                       f1=f1+gp[k-1]*cp[1,k-1]-gp[k]*cp[1,k]-gm[k]*cm[1,k];
                       f2=f2+gp[k-1]*cp[2,k-1]-gp[k]*cp[2,k]-gm[k]*cm[2,k];
                       f3=f3+gp[k-1]*cp[3,k-1]-gp[k]*cp[3,k]-gm[k]*cm[3,k];
                       f4=f4+gp[k-1]*cp[4,k-1]-gp[k]*cp[4,k]-gm[k]*cm[4,k];
                       f5=f5+gp[k-1]*cp[5,k-1]-gp[k]*cp[5,k]-gm[k]*cm[5,k];
                       f6=f6+gp[k-1]*cp[6,k-1]-gp[k]*cp[6,k]-gm[k]*cm[6,k];
                    end;
                 if (i<>1) and (i<>k) then
                    begin
                       f1=f1+gp[i-1]*cp[1,i-1]+gm[i+1]*cm[1,i+1]-gp[i]*cp[1,i]-gm[i]*cm[1,i];
                       f2=f2+gp[i-1]*cp[2,i-1]+gm[i+1]*cm[2,i+1]-gp[i]*cp[2,i]-gm[i]*cm[2,i];
                       f3=f3+gp[i-1]*cp[3,i-1]-gp[i]*cp[3,i]-gm[i]*cm[3,i];
                       f3=f3+gm[i+1]*cm[3,i+1];
                       f4=f4+gp[i-1]*cp[4,i-1]+gm[i+1]*cm[4,i+1]-gp[i]*cp[4,i]-gm[i]*cm[4,i];
                       f5=f5+gp[i-1]*cp[5,i-1]+gm[i+1]*cm[5,i+1]-gp[i]*cp[5,i]-gm[i]*cm[5,i];
                       f6=f6+gp[i-1]*cp[6,i-1]+gm[i+1]*cm[6,i+1]-gp[i]*cp[6,i]-gm[i]*cm[6,i];
                    end;

                 f1=f1*1e+10; f2=f2*1e+10; f3=f3*1e+10; f4=f4*1e+10; f5=f5*1e+10; f6=f6*1e+10;
                 if k>20 then  print(' Ў1[',i:3,']= ',f1:9:6,' Ў2[',i:3,']= ',f2:9:6,' Ў3[',i:3,']= ',f3:9:6,
                 ' Ў4[',i:3,']= ',f4:9:6,' Ў5[',i:3,']= ',f5:9:6,' Ў6[',i:3,']= ',f6:9:6);
                 if k<=20 then print(' Ў1[',i:3,']= ',f1:9:6,' Ў2[',i:3,']= ',f2:9:6,' Ў3[',i:3,']= ',f3:9:6,
                 ' Ў4[',i:3,']= ',f4:9:6,' Ў5[',i:3,']= ',f5:9:6,' Ў6[',i:3,']= ',f6:9:6);
                 if (i=11) or (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
                    begin
                       print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
                    end;
              end;
     print(' бг¬¬  Ї®в®Є®ў ', f22:15:10);
     write(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
     print(' Є®­жҐ­ва жЁЁ 1-© Є®¬Ї®­Ґ­вл ');
     for i=1 to k :
          begin c[1,i]=(cm[1,i]*gm[i]+cp[1,i]*gp[i])/g[i];
                print(' cm[1,',i:3,']= ',cm[1,i]:14:12,' cp[1,',i:3,']= ',cp[1,i]:14:12,' c[1,',i:3,']= ',c[1,i]:14:12);
                 if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
                 begin
                      print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
                 end;
     end;
     print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
     print(' Є®­жҐ­ва жЁЁ 2-© Є®¬Ї®­Ґ­вл ');
     for i=1 to k :
     begin
         c[2,i]=(cm[2,i]*gm[i]+cp[2,i]*gp[i])/g[i];
         print(' cm[2,',i:3,']= ',cm[2,i]:14:12,' cp[2,',i:3,']= ',cp[2,i]:14:12,' c[2,',i:3,']= ',c[2,i]:14:12);
              if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
               begin
                  print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
               end;
     end;
     write(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
     print(' Є®­жҐ­ва жЁЁ 3-© Є®¬Ї®­Ґ­вл ');
     for i=1 to k :
      begin
         f=(cm[3,i]*gm[i]+cp[3,i]*gp[i])/g[i];
         f1=cm[3,i]; f2=cp[3,i];
         print(' cm[3,',i:3,']= ',f1:14:12,' cp[3,',i:3,']= ',f2:14:12,' c[3,',i:3,']= ',f:14:12);
              if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
               begin
                  print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
               end;
      end;
      write(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
      print(' Є®­жҐ­ва жЁЁ 4-© Є®¬Ї®­Ґ­вл ');
      for i=1 to k :
       begin
         f=(cm[4,i]*gm[i]+cp[4,i]*gp[i])/g[i];
         f1=cm[4,i]; f2=cp[4,i];
         print(' cm[4,',i:3,']= ',f1:14:12,' cp[4,',i:3,']= ',f2:14:12,' c[4,',i:3,']= ',f:14:12);
              if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
               begin
                  print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
               end;
       end;
       write(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
       print(' Є®­жҐ­ва жЁЁ 5-© Є®¬Ї®­Ґ­вл ');
       for i=1 to k :
          begin
             f=(cm[5,i]*gm[i]+cp[5,i]*gp[i])/g[i];
             f1=cm[5,i]; f2=cp[5,i];
             print(' cm[5,',i:3,']= ',f1:14:12,' cp[5,',i:3,']= ',f2:14:12,' c[5,',i:3,']= ',f:14:12);
                  if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
                   begin
                      print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
                   end;
          end;
       write(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
       print(' Є®­жҐ­ва жЁЁ 6-© Є®¬Ї®­Ґ­вл ');
       for i=1 to k :
          begin
             f=(cm[6,i]*gm[i]+cp[6,i]*gp[i])/g[i];
             f1=cm[6,i]; f2=cp[6,i];
             print(' cm[6,',i:3,']= ',f1:14:12,' cp[6,',i:3,']= ',f2:14:12,' c[6,',i:3,']= ',f:14:12);
                  if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
                   begin
                      print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
                   end;
          end;
       write(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
       print(' Є®­жҐ­ва жЁЁ 7-© Є®¬Ї®­Ґ­вл ');
       for i=1 to k :
          begin
             f=((1-cm[1,i]-cm[2,i]-cm[3,i]-cm[4,i]-cm[5,i]-cm[6,i])*gm[i]+(1-cp[1,i]-cp[2,i]-cp[3,i]-cp[4,i]-cp[5,i]-cp[6,i])*gp[i])/g[i];
             f1=1-cm[1,i]-cm[2,i]-cm[3,i]-cm[4,i]-cm[5,i]-cm[6,i]; f2=1-cp[1,i]-cp[2,i]-cp[3,i]-cp[4,i]-cp[5,i]-cp[6,i];
             print(' cm[7,',i:3,']= ',f1:14:12,' cp[7,',i:3,']= ',f2:14:12,' c[7,',i:3,']= ',f:14:12);
                  if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
                   begin
                      print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
                   end;
          end;
       write(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
       print(' ®в­®бЁвҐ«м­лҐ Є®­жҐ­ва жЁЁ 2/5-© Є®¬Ї®­Ґ­вл');
       for i=1 to k :
          begin
             f=cm[2,i]/(1-cm[1,i]-cm[2,i]-cm[3,i]-cm[4,i]-cm[5,i]-cm[6,i]); f1=cp[2,i]/(1-cp[1,i]-cp[2,i]-cp[3,i]-cp[4,i]-cp[5,i]-cp[6,i]);
             f2=c[2,i]/(1-c[1,i]-c[2,i]-c[3,i]-c[4,i]-c[5,i]-c[6,i]);
             {f=rm[i]; f1=rp[i]; f2=r[i];}
             print(' rm[2,',i:3,']= ',f:12,' rp[2,',i:3,']= ',f1:12,' r[2,',i:3,']= ',f2:12);
             if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
                begin
                   print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
                end;
       end;
       write(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
       print(' ®в­®бЁвҐ«м­лҐ Є®­жҐ­ва жЁЁ 1/5-© Є®¬Ї®­Ґ­вл');
       for i=1 to k :
          begin
             f=cm[1,i]/(1-cm[1,i]-cm[2,i]-cm[3,i]-cm[4,i]-cm[5,i]-cm[6,i]); f1=cp[1,i]/(1-cp[1,i]-cp[2,i]-cp[3,i]-cp[4,i]-cp[5,i]-cp[6,i]);
             f2=c[1,i]/(1-c[1,i]-c[2,i]-c[3,i]-c[4,i]-c[5,i]-c[6,i]);
             {f=rm[i]; f1=rp[i]; f2=r[i];}
             print(' rm[1,',i:3,']= ',f:12,' rp[1,',i:3,']= ',f1:12,' r[1,',i:3,']= ',f2:12);
             if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
                begin
                   print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
                end;
       end;
       write(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;

       for i=1 to k :
          begin
             f3=gp[i]/gm[i];
             f=f3*cp[1,i]/cm[1,i]; f1=f3*cp[2,i]/cm[2,i]; f2=f3*cp[3,i]/cm[3,i]; f4=f3*cp[4,i]/cm[4,i];
             print(' b[1,',i:3,']= ',f:7:5,' b[2,',i:3,']= ',f1:7:5,' b[3,',i:3,']= ',f2:7:5,' b[4,',i:3,']= ',f4:7:5);
             if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
                begin
                   print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
                end;
          end;
     print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;}
     print(' баҐ§л Ї® Є®¬Ї®­Ґ­в ¬ ');
     for i=1 to k :
        begin
           print(' fi[2,',i:3,']= ',fi[2,i]:4:2,' fi[3,',i:3,']= ',fi[3,i]:4:2,' fi[4,',i:3,']= ',fi[4,i]:4:2,' fi[5,',i:3,']= ',fi[5,i]:4:2,' sig=',sig[i]:6:4);
           if (i=22) or (i=44) or (i=66) or (i=88)  or (i=110) or (i=132) then
              begin
                 print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
              end;
        end;
     print(' ¤«п Їа®¤®«¦Ґ­Ёп ­ ¦¬ЁвҐ ENTER '); readln;
   end; {Тут пиздец}

begin
    { TO: -oUser -cConsole Main : Insert code here }
   k=70; p=38;
     for i in range (0;k+1): 
         T0[i]=0; ko1[i]=0; ko2[i]=0; ko3[i]=0; ko4[i]=0; ko5[i]=0; ko6[i]=0;
         TM[i]=0; ccm[1,i]=0; ccm[2,i]=0; ccm[3,i]=0; ccm[4,i]=0; ccm[5,i]=0; ccm[6,i]=0;
         TP[i]=0; ccp[1,i]=0; ccp[2,i]=0; ccp[3,i]=0; ccp[4,i]=0; ccp[5,i]=0; ccp[6,i]=0;
     nn=p;
     ko1[p]=0.1484; ko2[p]=0.0925; ko3[p]=0.1592; ko4[p]=0.1668; ko5[p]=0.0955; ko6[p]=0.2413; T0[p]=1;


     m1=92; m2=94; m3=95; m4=96; m5=97; m6=98; m7=100;
     {
     for i in range (1;k):
         n[i]=2;
     }

     {Ran:mize;}
     {print ('vvod nomera izotopa - ogranichenie cmax'); input(iz);}

     {p=20; ko1[p]=1.5e-11; ko2[p]=0.00002; ko3[p]=0.0035; ko4[p]=0.001; T0[p]=5;}
     for i in range (1;k):
         xi[4,i]=2;
         xi[1,i]=exp((m7-m1)/(m7-m4)*ln(xi[4,i]));
         xi[2,i]=exp((m7-m2)/(m7-m4)*ln(xi[4,i]));
         xi[3,i]=exp((m7-m3)/(m7-m4)*ln(xi[4,i]));
         xi[5,i]=exp((m7-m5)/(m7-m4)*ln(xi[4,i]));
         xi[6,i]=exp((m7-m6)/(m7-m4)*ln(xi[4,i]));

     print('
     xi1= ',xi[1,1]:12:8,'
     xi2= ',xi[2,1]:12:8,'
     xi3= ',xi[3,1]:12:8,'
     xi4= ',xi[4,1]:12:8,'
     xi5= ',xi[5,1]:12:8,'
     xi6= ',xi[6,1]:12:8);

     readln;

     f1=sqrt(xi[5,1]);
     for i in range (1;k-1):
           f2=xi[5,1]/f1;
           sig[i]=0.2973;
     f1=sqrt(xi[3,1]);
     for i=k:
           f2=xi[3,1]/f1;
           sig[i]=0.2973;
           {f1=f2}


     print(' vvod cp[1,k]n, cp[1,k]v'); input(czn,czv);
     {print(' :p otbor - tpd'); input(tpd);}
     print(' vvod gz'); input(gz);
     iterx; print(' ii= ',ii:3,' jj= ',jj:3);


     f=0; for i in range (1;k):
         f=f+xi[4,i]; 
         print(' sred xi[4,i]= ',f/k:15:12);
     nn=jp; sech; sech1; sech2;
     print(' sech T= ',fs1:12:8,' sech T11= ',fs:12:8,' sech TP= ',fs2:12:8);
     cmax=cp[iz,jp];
     print('cmax=',cmax:12:9,' nn=',nn:3); readln;
     pech;

     print('cmax=',cmax:12:9,' nn=',nn:3); readln;
     :potbor;

     f=0; for i in range (1;k):
         f=f+g[i]; sg=f; 
     print(' sg= ',sg:15:4);
     print(' sred g= ',f/k:12:8);
     print(' sig[1]= ',sig[1]:12:9,' sig[k]= ',sig[k]:12:9); readln;

     {cz=cmax;}
     f1=0; for iin range (1;k):
         f1=f1+sqr(g[i]-gz);
     fmin=f1; 
     print(' fmin= ',fmin:15:8);

     i1=20; f1=0.01;

     pchel(i1,f1);
     for i=1 to k :
        begin
           sig[i]=ssig[i];
        end;
     iterx;
     sech; sech1; sech2;
     print(' sech T= ',fs1:12:8,' sech T11= ',fs:12:8,' sech TP= ',fs2:12:8);
     print(' cmax=',cz:16:14);


     f=0; for i=1 to k : f=f+g[i]; f1=0; for i=1 to k : f1=f1+sqr(g[i]-gz);
     fmin=f1; print(' fmin= ',fmin:15:8);
     print(' povtor calculation: Suuma G =',f:15:4,' nn=',nn:3,' cp[iz,nn]= ',cp[iz,nn]:12:8);
     print; pech;
     :potbor;

     max;
     f=0; for i=1 to k : f=f+g[i];
     print(' chek max concentration');
     print('fun=',fun:12:9,' jp=',jp:3,' cmax= ',cp[iz,jp]:12:8,' summa G= ',f:15:8);

     print('  ¤«п ®Є®­з ­Ёп ­ ¦ вм ENTER  '); readln;
end.