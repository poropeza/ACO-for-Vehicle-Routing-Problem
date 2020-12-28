function [model,Peter]=CreateModel(capacidad)

    Problem=Problem25();
    
    %lee el archivo de los clientes
    x= Problem(:,2);%arreglo en el que almacena las coordenadas en x de los clientes
    y= Problem(:,3);%arreglo en el que almacena las coordenadas en y de los clientes
    Demanda= Problem(:,4);%arreglo en el que almacena las demandas de los clientes
    s= Problem(:,5);%arreglo en el que almacena los tiempos necesarios para servir a los clientes
    a= Problem(:,6);%arreglo en el que se almacena el tiempo inicial disponible en el que los clientes pueden ser servidos
    b= Problem(:,7);%arreglo en el que se almacena el tiempo final disponible en el que los clientes pueden ser servidos

    %Wj= zeros(length(s));%%arreglo que va a tener la informaci�n de la instancia en que el cliente siguiente fue servido?????
    
    Peter=0;
    
    
    
    n=numel(x);
    
    D=zeros(n,n); %matriz para las distancias entre clientes
    T=zeros(n,n); %matriz para el tiempo estimado entre los clientes medianta los valores arrojados por la ecuaci�n
    Vk=zeros(n,n); %matriz que contendr� la informaci�n de las velocidades que tendr�n las rutas
   
    ControlX=10;
    ControlL=5;
            
    
    %calcula la distancia entre los clientes
    for i=1:n-1
        
        for j=i+1:n
            
            D(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
            
             D(j,i)=D(i,j);
            
  
        end
      
      
    end
    
    for i=1:n
        for j=1:n
            %generaci�n aleatoria de n�meros entre 0 y 1 para la ecuaci�n de la velocidad
            
            for p=1:10
             VE(1,p)=randi([1,10])/10; %VE= variables estocasticas definidas en la ecuaci�n estructural, siguiendo el orden definido
            end


            for h=3:10 %ciclo para asignar los dos �nicos valores que almacenan ciertas VE
                switch h
                    case 3
                        if VE(1,h)>=0.5
                           VE(1,h)=1;
                        else
                            VE(1,h)=0.1;
                        end

                    case 4
                        if VE(1,h)>=0.5
                           VE(1,h)=1;
                        else
                            VE(1,h)=0.1;
                        end

                    case 5
                        if VE(1,h)>=0.5
                           VE(1,h)=1;
                        else
                            VE(1,h)=0.1;
                        end

                    case 6
                        if VE(1,h)>=0.5
                           VE(1,h)=1;
                        else
                            VE(1,h)=0.1;
                        end

                    case 9
                        if VE(1,h)>=0.5
                           VE(1,h)=1;
                        else
                            VE(1,h)=0.1;
                        end

                    case 10
                        if VE(1,h)>=0.5
                           VE(1,h)=1;
                        else
                            VE(1,h)=0.1;
                        end

                end
            end

            
            Vk(i,j)= (sum(VE)* ControlX)-ControlL;
            
            %Vk(j,i)=Vk(i,j);
            
            T(i,j)= D(i,j)/Vk(i,j);% tiempo=distancia/velocidad
            %T(j,i)=T(i,j);%es el mismo tiempo de regreso
        end
    end
    
     
   %disp(T);   
            
            
            
           
    
    %disp(Vk);
  
    
    %ordenar la matriz de distancias de menor a mayor en otra que se llama
    %Clon, as� como se alinean las coordenas de los clientes y sus demandas
    %en copias tambi�n
    
    %Clon=D(:,1); %va a tener la informaci�n de la distancia de los clientes 
    %Clon=T(:,1);
    Clon=a(:,1);
    
    for i=1:n
       cliente(i)=i; %sirve para tener en un arreglo paralelo los �ndices de los clientes ordenados
    end
    
  
    %asigna el nombre de los municipios
    municipio= {'dep�sito';'jiutepec';'tlaltizap�n';'temixco';'miacatl�n';'yautepec';'huitzilac';'tepoztl�n';'mazatepec';'tetecala';'totolapan';'amacuzac';'jojutla';'emiliano zapata';'coatl�n del r�o';'ocuituco';'jantetelco';'tepalcingo';'atlatlahuacan';'tlalnepantla';'tlaquiltenango';'puente de ixtla';'xochitepec';'ayala';'tetela del volc�n';'axochiapan';'zacualpan de amilpas';'yecapixtla';'cuautla';'jonacatepec';'tlayacapan';'temoac';'zacatepec de hidalgo'};
    
    
    a1=a;
    b1=b;
    s1=s;
    
    for i=1:n
        for j=1:i-1
            
            if Clon(i)<Clon(j)%sirve para tener la distancia de los clientes ordenada
                aux= Clon(j);
                Clon(j)=Clon(i);
                Clon(i)=aux;
                
                aux2= cliente(j);%se van actualizando las posiciones, mediante el ordenamiento
                cliente(j)=cliente(i);
                cliente(i)=aux2;
                
                aux3= municipio(j);%se van actualizando las posiciones, mediante el ordenamiento
                municipio(j)=municipio(i);
                municipio(i)=aux3;
                
                %aqui tengo que poner que est�n alineados tambien los
                %vectores a,b
                
                aux4= a1(j);
                a1(j)=a1(i);
                a1(i)=aux4;
                
                aux5= b1(j);
                b1(j)=b1(i);
                b1(i)=aux5;
                
                aux6= s1(j);
                s1(j)=s1(i);
                s1(i)=aux6;
                
                
                
            end
        end
    end
    
    
    
    

   model.cliente=cliente;
   model.municipio=municipio;
    
   
   
    model.clienteServido= zeros(n); %arreglo de clientes con informaci�n de despacho
    %que tendr�n valores de 1 y 0 (inicializados en 0)
    model.clienteServido(1)=1; %se omite 
    
    cont=1;
    ind=1;
    rutas=0; %para saber la cantidad de rutas generadas
    
     while cont <= n %verifica que al menos exista un cliente sin servir     min(model.clienteServido)==0
         rutas=rutas+1;
         cont=cont+1;
         
         if cont <= n
             
             
             
             model.clienteservido(cont)=1;%significa que se le sirvi�
         
             disponibilidad= capacidad- Demanda(model.cliente(cont));
             z(ind).ruta=[municipio(cont)];%lleva el registro de la ruta, pero el nombre de los municipios
             ff(ind).ruta=[cliente(cont)];%toma el registro de la ruta, pero s�lo los �ndices

             while cont<numel(Demanda) && Demanda(model.cliente(cont+1)) <= disponibilidad  && (a1(cont)+s1(cont)+ T(model.cliente(cont),model.cliente(cont+1)) )< b1(cont+1)%busca hasta que ya no tengo clientes al que se le pueda distribuir en la ruta
                  
                 if Demanda(model.cliente(cont+1)) <= disponibilidad %la posici�n que sigue, tambi�n aplica en la ruta
                    cont=cont+1;
                    z(ind).ruta=[z(ind).ruta municipio(cont)];
                    ff(ind).ruta=[ff(ind).ruta,cliente(cont)];
                    disponibilidad= disponibilidad - Demanda(model.cliente(cont)); % se actualiza la capacidad actual del veh�culo
                    model.clienteservido(cont)=1;%significa que se le sirvi�
                 end
                 
  
             end
             z(ind).ruta=[municipio(1), z(ind).ruta];%se le agrega a la ruta el dep�sito
           
             ff(ind).ruta=[1,ff(ind).ruta];%ruta de �ndices de los clientes
             
             nn=numel(z(ind).ruta); %cantidad de elementos en esa ruta
             
             %W= zeros(nn);%arreglo que va a tener la informaci�n de la instancia en que el cliente actual fue servido
             
             tic; %inicia el reloj
             
             for i=2: nn-1 %para recorrer la ruta
                 
        
                if (a1(i)+s1(i)+ T(ff(ind).ruta(i),ff(ind).ruta(i+1)) )>= b1(i+1) %restricci�n de tiempo
                    Peter=1;
                    %return;
                else
                    ff(ind).W(i+1)=floor(toc/3600); %instancia cuando empieza a ser servido
                end 
                
             end

             
             %[row,col] = find(A==0)
             
             
             
             
             %m=zeros(nn,nn);
            
             
             %calcula la distancia entre los clientes para cada ruta

                % for i=1:nn
                 %   for j=i:nn
                        
                       
                  %     m(i,j)=sqrt((x(ff(ind).ruta(i))-x(ff(ind).ruta(j))).^2+(y(ff(ind).ruta(i))-y(ff(ind).ruta(j))).^2);

                   %    m(j,i)=m(i,j);

                    %end
                 %end

         
             
             
             %z(ind).matrizD= m; %se guarda la matriz de costos para cada ruta
             z(ind).nn=nn;%numero de elementos en esa ruta
             %ff = ff(randperm(length(ff)));
             
             z(ind).ff=ff;
               
             ind=ind+1;

         end
         
         
         
     end
     
    rutas=rutas-1; %se coloca en el valor correspondiente

    model.z=z; %tiene las rutas y las matrices de costos
    model.rutas=rutas;
    model.n=n;
    model.x=x;
    model.y=y;
    model.d=Demanda;
    model.D=D;
    model.T=T;
    

end