function generate_allpossible(vals,n)
global allpossible
if (length(vals)==n)
    allpossible = [allpossible;vals];
   return
end
generate_allpossible([vals 0],n)
generate_allpossible([vals 1],n)
generate_allpossible([vals -1],n)
end

