function [res,gamma,a,b]=GammaNormalization(x,a,b,gamma)

res=zeros(size(x));

if (nargin<4)
    n=length(x(:));
    t=(1:n)/(n+1);
    if (nargin<3)
        ab=inv([min(x(:)) 1; max(x(:)) 1])*[1; n]/(n+1);
        a=ab(1);
        b=ab(2);
    end
    sx=sort(x(:)*a+b);
    ll=1;
    y=sx.*ll;
    cE=sum(t(:)-y(:));
    while (cE>0)
        ll=0.5*ll;
        y=sx.^ll;
        cE=sum(t(:)-y(:));
    end
    ul=1;
    y=sx.*ul;
    cE=sum(t(:)-y(:));
    while (cE<0)
        ul=2*ul;
        y=sx.^ul;
        cE=sum(t(:)-y(:)); % fprintf('%.4f %.4e\n',ul,cE);
    end
    while (ul-ll>1e-4)
        ml=(ll+ul)/2;
        y=sx.^ml;
        cE=sum(t(:)-y(:));
        if (cE<0)
            ll=ml;
        else
            ul=ml;
        end
    end
    gamma=(ll+ul)/2;
    J=[];
else
    J=find(a*x(:)+b<=0);
end
res=(a*x+b).^gamma;
if (length(J)>0)
    res(J)=NaN;
end
