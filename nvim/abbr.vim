" This file contains all of the abbreviations I use. 
" Some of them can get quite long so they're stored 
" in this separate file

" LaTeX grid 
iabbrev drawgrid 
\<CR>\begin{center}
\<CR>\begin{tikzpicture}
\<CR>\begin{axis} [
\<CR>title={Graph of $x$},
\<CR>axis lines = center,
\<CR>xlabel = $x$,
\<CR>ylabel = $y$,
\<CR>xmajorgrids=true,
\<CR>ymajorgrids=true,
\<CR>xmin=-10,
\<CR>xmax=10,
\<CR>ymin=-10,
\<CR>ymax=10
\<CR>]
\<CR>...Stuff goes here...
\<CR>\end{axis}
\<CR>\end{tikzpicture}
\<CR>\end{center} 

" Math markdown document header
iabbrev mathhead 
\<CR>---
\<CR>header-includes:
\<CR><Tab>- \usepackage{tikz}
\<CR><Tab>- \usepackage{pgfplots} 
\<CR>---
\<CR>
\<CR><link rel="stylesheet" type="text/css" href="/home/jed/.css/tufte/tufte.css" />


