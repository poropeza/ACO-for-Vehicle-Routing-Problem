function ruta=displayTour( tour )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   
    ruta=[];
    for i=1:length(tour)
       
        switch tour(i)
            case 1
                ruta=[ruta 'deposito '];
            case 2
             ruta=[ruta 'jiutepec '];
            case 3
                ruta=[ruta 'tlaltizapán '];
            case 4
                ruta=[ruta 'temixco '];
            case 5
               ruta=[ruta 'miacatlán '];
            case 6
             ruta=[ruta 'yautepec '];
            case 7
                ruta=[ruta 'huitzilac '];
            case 8
             ruta=[ruta 'tepoztlán '];
            case 9
                ruta=[ruta 'mazatepec '];
            case 10
                ruta=[ruta 'tetecala '];
            case 11
               ruta=[ruta 'totolapan '];
            case 12
                ruta=[ruta 'amacuzac '];
            case 13
                ruta=[ruta 'jojutla '];
            case 14
             ruta=[ruta 'emiliano zapata '];
            case 15
                ruta=[ruta 'coatlán del río '];
            case 16
                ruta=[ruta 'ocuituco '];
            case 17
               ruta=[ruta 'jantetelco '];
            case 18
             ruta=[ruta 'tepalcingo '];
            case 19
                ruta=[ruta 'atlatlahuacan '];
            case 20
             ruta=[ruta 'tlalnepantla '];
            case 21
                ruta=[ruta 'tlaquiltenango '];
            case 22
                ruta=[ruta 'puente de ixtla '];
            case 23
               ruta=[ruta 'xochitepec '];
            case 24
                ruta=[ruta 'ayala '];
            case 25
             ruta=[ruta 'tetela del volcán '];
            case 26
                ruta=[ruta 'axochiapan '];
            case 27
                ruta=[ruta 'zacualpan de amilpas '];
            case 28
               ruta=[ruta 'yecapixtla '];
            case 29
                ruta=[ruta 'cuautla '];
            case 30
                ruta=[ruta 'jonacatepec '];
            case 31
                ruta=[ruta 'tlayacapan '];
            case 32
                ruta=[ruta 'temoac '];
            case 33
                ruta=[ruta 'zacatepec de hidalgo '];
        end
        
    end

end

