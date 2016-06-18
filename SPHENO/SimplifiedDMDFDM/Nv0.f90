! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:11 on 17.6.2016   
! ----------------------------------------------------------------------  
 
 
Module Nv03Decays_SimplifiedDMDFDM 
 
Use Control 
Use CouplingsForDecays_SimplifiedDMDFDM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine Nv0ThreeBodyDecay(n_in,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,              & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,              & 
& ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gTVWp,gNv0FrecFdFu,gNv0FrecFeFv,    & 
& epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,            & 
& MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Complex(dp) :: cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),          & 
& cplcNv0FreVWpL,cplcNv0FreVWpR

Real(dp),Intent(in) :: g1,g2,g3,MDF,v

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),mH2

Real(dp),Intent(inout) :: gNv0FrecFdFu(1,1,3,3),gNv0FrecFeFv(1,1,3,3)

Real(dp),Intent(in) :: gTVWp

Real(dp) :: gNv0FrecFdFui(1,3,3),gNv0FrecFeFvi(1,3,3)

Real(dp) :: gTVWptemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'Nv0ThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gTVWptemp = 0._dp 
Else 
gTVWptemp = gTVWp 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 1 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 1) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,1) = ',n_in,1 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
i_run = 1 
 
Call CouplingsFor_Nv0_decays_3B(MNv0,i_run,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,           & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,            & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,cplcFdFucVWpL,cplcFdFucVWpR,    & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcNv0FreVWpL,cplcNv0FreVWpR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gNv0FrecFdFui = 0._dp 
Call Nv0ToFrecFdFu(i_run,MFre,MFd,MFu,MVWp,MNv0,cplcFdFucVWpL,cplcFdFucVWpR,          & 
& cplcNv0FreVWpL,cplcNv0FreVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,             & 
& deltaM,epsI,check,gNv0FrecFdFui)

gNv0FrecFdFu(i_run,:,:,:) = gNv0FrecFdFui 
gT = gT + Sum(gNv0FrecFdFui) 
 
gNv0FrecFeFvi = 0._dp 
Call Nv0ToFrecFeFv(i_run,MFre,MFe,MVWp,MNv0,cplcFeFvcVWpL,cplcFeFvcVWpR,              & 
& cplcNv0FreVWpL,cplcNv0FreVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,             & 
& deltaM,epsI,check,gNv0FrecFeFvi)

gNv0FrecFeFv(i_run,:,:,:) = gNv0FrecFeFvi 
gT = gT + Sum(gNv0FrecFeFvi) 
 
If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,1
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gNv0FrecFdFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,1
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gNv0FrecFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT.Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine Nv0ThreeBodyDecay
 
 
Subroutine Nv0ToFrecFdFu(iIN,MFre,MFd,MFu,MVWp,MNv0,cplcFdFucVWpL,cplcFdFucVWpR,      & 
& cplcNv0FreVWpL,cplcNv0FreVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,          & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFre,MFd(3),MFu(3),MVWp,MNv0

Complex(dp),Intent(in) :: cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcNv0FreVWpL,cplcNv0FreVWpR

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWp

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MNv0 
 
Isum = 1 
Allocate( gSum(1,3,3, Isum) ) 
Allocate( Contribution(1,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MNv0).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MFre))) Then 
!-------------- 
!  VWp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFre 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcNv0FreVWpL) 
coup(1) = Conjg(cplcNv0FreVWpR) 
coup(4) = Conjg(cplcFdFucVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFucVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Fre cFd Fu Propagator: VWp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='VWp'



Else 
gSum(1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
      Do gt2=1,3
        Do gt3=1,3
g(1,gt2,gt3)=Sum(gSum(1,gt2,gt3,1:1))
If (g(1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
  g = oo512pi3 / Abs(MNv0)**3*g
End Subroutine Nv0ToFrecFdFu 
 
 
Subroutine Nv0ToFrecFeFv(iIN,MFre,MFe,MVWp,MNv0,cplcFeFvcVWpL,cplcFeFvcVWpR,          & 
& cplcNv0FreVWpL,cplcNv0FreVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,          & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFre,MFe(3),MVWp,MNv0

Complex(dp),Intent(in) :: cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcNv0FreVWpL,cplcNv0FreVWpR

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWp

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MNv0 
 
Isum = 1 
Allocate( gSum(1,3,3, Isum) ) 
Allocate( Contribution(1,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MNv0).gt.(Abs(0.)+Abs(MFe(gt2))+Abs(MFre))) Then 
!-------------- 
!  VWp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFre 
mass(3) = -MFe(gt2) 
mass(4) = 0. 
 
coup(2) = Conjg(cplcNv0FreVWpL) 
coup(1) = Conjg(cplcNv0FreVWpR) 
coup(4) = Conjg(cplcFeFvcVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFvcVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Fre cFe Fv Propagator: VWp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='VWp'



Else 
gSum(1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
      Do gt2=1,3
        Do gt3=1,3
g(1,gt2,gt3)=Sum(gSum(1,gt2,gt3,1:1))
If (g(1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
  g = oo512pi3 / Abs(MNv0)**3*g
End Subroutine Nv0ToFrecFeFv 
 
 
End Module Nv03Decays_SimplifiedDMDFDM 
 