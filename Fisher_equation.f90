! Date : 19-02-2015
! @shachi
!solution of Fisher equation using finite differnce method (## Partial diff equn with nonlinear term)
! del c/del t = mu c(1-c) + D del2 c/del x2
! Discretise ----> Nx no of Recurtion equation(initial known) ----> 
! c on Left boundary = 1 & c on Right boundary = 0  

program Fisher_soln
    implicit none
    
    integer(8) :: i,j,k,Nt,Nx
    real(8) :: dx,dt,T,L,D,gamma2,mu,gamma1,time,v, lam
    real(8), allocatable ::  co(:),cn(:)
    !Initialize
    T = 20.0d0
    L = 10.0d0
    Nt = 1000.0d0   ! No of discrete points on time axis 
    Nx = 100.0d0    ! No of discrete points on X axis
    dx = L/Nx       !  Not a periodic boundary condition
    dt = T/Nt
    D = 0.10d0
    mu = 1.00d0
    gamma1 = (mu*dt)
    gamma2 = (D*dt)/dx**2.0        ! FOR Converge gamma1 & gamma2 <= 0.5 ( Check it for Fisher euqation)  
 
    write (*,'(a8,f12.6)') 'gamma1=',gamma1
    write (*,'(a8,f12.6)') 'gamma2=',gamma2
    write (*,'(a8,f12.6)') 'dx = ',dx
    write (*,'(a8,f12.6)') 'dt = ',dt
    allocate(co(0:Nx+1))              
    allocate(cn(0:Nx+1))  
 
    !Initial value of concentration
    co = 0.0d0
    cn = 0.0d0
    
    !delta function at x=x0=0 at initial time  <----------------- Initial condition
    co(0) = 1.0d0
    cn(0) = 1.0d0
    
    v = 2 * sqrt(D * mu)
    lam = sqrt(mu / D)
 
    time=0.0
    !We get plot after time T
    T = 10.0
    do while (time<= T)
        !Periodic boundary   <----------------------------------- Boundary condition
        co(Nx+1) = 0.0d0
        co(0) = 1.0d0
        do i= 1, Nx
            cn(i) = co(i) + gamma1*co(i)*(1-co(i)) + gamma2*(co(i+1)-2*co(i)+co(i-1))
        end do
        co=cn
        time=time+dt
    end do
 
    open(1, file='Fisher.txt', status='replace')
 
    
    do k= 0,Nx
        write(1,'(f12.8,  f12.8, f12.8)') k*dx , cn(k),analytic(k*dx,v, lam,time)
    end do
   
    close(1)
    call system('gnuplot -p Fisher.gnu')

    contains
    real(8) function analytic(x,v, lam,time)
        real(8), intent(in) :: v,x,lam,time
        ! Calculate the result
        analytic = 1 / (1 + exp(lam * (x - v * time)))
    end function analytic

 end program Fisher_soln