function A = skeleton(A) %Zhang-Suen Thinning Algorithm (Input Should be Binary Image)

A=~A;
[n,m]=size(A);
M=zeros(n,m);
%Initialisations

while(true) %Controlling Iteration(s)
    
    C=0;
    M=zeros(n,m);
    
    %First Subiteration to remove south-east boundary points and the north-west corner points
    for i=2:(n-1)
        for j=2:(m-1)

            if(A(i,j)==0)   continue;
            end
            P=[A(i,j),A(i-1,j),A(i-1,j+1),A(i,j+1),A(i+1,j+1),A(i+1,j),A(i+1,j-1),A(i,j-1),A(i-1,j-1)];
            
            %Condition one
            b=0;
            for k=2:9
                b=b+P(k);
            end
            if(b<2 || b>6)
                continue;
            end
            
            %Condition two
            a=0;
            for k=2:8
                if(P(k)==0 && P(k+1)==1)
                    a=a+1;
                end
            end
            if(P(9)==0 && P(2)==1)
                a=a+1;
            end
            if(~(a==1))
                continue;
            end
            
            %Condition three and four
            if(((P(2)*P(4)*P(6))==0) && ((P(4)*P(6)*P(8))==0))
                M(i,j)=1;
                C=C+1;
            else
            end
        end
    end
    %First Subiteration end
    
    A=A-M;
    M=zeros(n,m);
    
    %Second Subiteration to remove north-west boundary point or a south-east corner point
    for i=2:(n-1)
        for j=2:(m-1)

            if(A(i,j)==0)   continue;
            end
            P=[A(i,j),A(i-1,j),A(i-1,j+1),A(i,j+1),A(i+1,j+1),A(i+1,j),A(i+1,j-1),A(i,j-1),A(i-1,j-1)];
            
            %Condition one
            b=0;
            for k=2:9
                b=b+P(k);
            end
            if(b<2 || b>6) continue;
            end
            
            %Condition two
            a=0;
            for k=2:8
                if(P(k)==0 && P(k+1)==1)
                    a=a+1;
                end
            end
            if(P(9)==0 && P(2)==1)
                a=a+1;
            end
            if(~(a==1)) continue;
            end
            
            %Condition three and four
            if(P(2)*P(4)*P(8)==0 && P(2)*P(6)*P(8)==0)
                M(i,j)=1;
                C=C+1;
            end
        end
    end
    %Second Subiteration end
    
    A=A-M;
    imshow(~A);
    
    if(C==0)    %Controlling Iteration(s)
        break;
    end
    
end
A=~A;
