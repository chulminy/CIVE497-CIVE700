function T = convertToAffine3d(T_affine)
      T = T_affine.T;
      T = T';
end