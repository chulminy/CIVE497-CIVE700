function I = undistort(Idistorted, params)

% Reference : https://groups.google.com/forum/#!msg/vsfm/IcbdIVv_Uek/Us32SBUNK9oJ
% Copy the text here
%{

When setting the PBA library to estimate the measurement radial 
(un)distortion (PBA_MEASUREMENT_DISTORTION), considerable work is 
needed to undistort the images using the estimated radial coefficient 
since a couple of cubic equations have to be solved in order to find 
the distorted position of the pixel. The following function computes 
directly the pixel position in the distorted image, given the 
undistorted position and the radial (un)distortion coefficient 
estimated by PBA. 

// given an undistorted pixel coordinate (pt) and one radial- 
(un)distortion parameter (k1), 
// compute the corresponding distorted pixel coordinate 
Point2f DistortPointR1(const Point2f& pt, double k1) { 
        if (k1 == 0) 
                return pt; 
        const double t2 = pt.y*pt.y; 
        const double t3 = t2*t2*t2; 
        const double t4 = pt.x*pt.x; 
        const double t7 = k1*(t2+t4); 
        if (k1 > 0) { 
                const double t8 = 1.0/t7; 
                const double t10 = t3/(t7*t7); 
                const double t14 = sqrt(t10*(0.25+t8/27.0)); 
                const double t15 = t2*t8*pt.y*0.5; 
                const double t17 = pow(t14+t15,1.0/3.0); 
                const double t18 = t17-t2*t8/(t17*3.0); 
                return Point2f(t18*pt.x/pt.y, t18); 
        } else { 
                const double t9 = t3/(t7*t7*4.0); 
                const double t11 = t3/(t7*t7*t7*27.0); 
                const std::complex<double> t12 = t9+t11; 
                const std::complex<double> t13 = sqrt(t12); 
                const double t14 = t2/t7; 
                const double t15 = t14*pt.y*0.5; 
                const std::complex<double> t16 = t13+t15; 
                const std::complex<double> t17 = pow(t16,1.0/3.0); 
                const std::complex<double> t18 = (t17+t14/ 
(t17*3.0))*std::complex<double>(0.0,sqrt(3.0)); 
                const std::complex<double> t19 = -0.5*(t17+t18)+t14/(t17*6.0); 
                return Point2f(t19.real()*pt.x/pt.y, t19.real()); 
        } 
} 
%}

cx = params.cx;
cy = params.cy;
r  = params.r;

if r==0;
    I = Idistorted;
    return
end

I = zeros(size(Idistorted));

[ii,jj] = find(~isnan(I(:,:,1)));

ii = ii - cy;  ii(ii==0) = 1.e-12 ;
jj = jj - cx;  jj(jj==0) = 1.e-12 ;

% keyboard;

t2 = ii.*ii;
t3 = t2.*t2.*t2;
t4 = jj.*jj;
t7 = r.*(t2+t4);


if r > 0
    t8 =  1.0./t7;
    t10 = t3./(t7.*t7);
    t14 = sqrt(t10.*(0.25+t8./27.0));
    t15 = t2.*t8.*ii*0.5;
    t17 = (t14+t15).^(1/3);
    t18 = t17-t2.*t8./(t17*3.0);
    
    x2  = t18 + cy;
    x1  = t18.*jj./ii  + cx;
else
    t9  = t3./(t7.*t7.*4);
    t11 = t3./(t7.*t7.*t7.*27);
    t12 = t9+t11;
    t13 = sqrt(t12);
    t14 = t2./t7;
    t15 = t14.*ii.*0.5;
    t16 = t13+t15;
    t17 = t16.^(1/3);
    t18 = (t17+t14./(t17.*3)).*(sqrt(-1)*sqrt(3));
    t19 = -0.5.*(t17+t18)+t14./(t17*6);
    
    x2 = real(t19) + cy;
    x1 = real(t19).*jj./ii  + cx;
end

if size(I,3) == 1;
    I = reshape(interp2(im2double(Idistorted), x1, x2),size(I));
else
    Ir = size(I,1);
    Ic = size(I,2);
    IdistortedG = double(Idistorted)./255;
    I(:,:,1) = reshape(interp2(IdistortedG(:,:,1), x1, x2),Ir,Ic);
    I(:,:,2) = reshape(interp2(IdistortedG(:,:,2), x1, x2),Ir,Ic);
    I(:,:,3) = reshape(interp2(IdistortedG(:,:,3), x1, x2),Ir,Ic);
end
