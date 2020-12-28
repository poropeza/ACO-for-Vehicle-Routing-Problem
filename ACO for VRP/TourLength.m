function L=TourLength(tour,model,r)

    n=numel(tour);

    tour=[tour tour(1)];
    
    L=0;
    for i=1:n
       %L=L+model.z(r).matrizD(tour(i),tour(i+1));
       L=L+model.D(tour(i),tour(i+1));
       
   
    end
    


end