% A class for abstract book
%
% Author: Jeongbin Park
% Description: A template for abstract books for Single-cell & Spatial Omics Workshops

\ProvidesClass{abstractbook}[29 Dec 2023 Abstract Book Class]
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{xkeyval}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\DeclareOptionX{marginleft}{\def\@marginleft{#1}}
\DeclareOptionX{marginright}{\def\@margintop{#1}}
\DeclareOptionX{margintop}{\def\@margintop{#1}}
\DeclareOptionX{marginbottom}{\def\@marginbottom{#1}}
\DeclareOptionX{bindingoffset}{\def\@bindingoffset{#1}}
\ProcessOptionsX \relax

\LoadClass{book}

\newcommand{\insertcopyrightnotice}{
    \thispagestyle{firstpage}
    \null\vfill
    {\footnotesize
    \doclicenseThis
    }
    \newpage
}

\ifx\@marginleft\undefined
    \def\@marginleft{1in}
\fi
\ifx\@marginright\undefined
    \def\@marginright{1in}
\fi
\ifx\@margintop\undefined
    \def\@margintop{1in}
\fi
\ifx\@marginbottom\undefined
    \def\@marginbottom{1in}
\fi
\ifx\@bindingoffset\undefined
    \def\@bindingoffset{6mm}
\fi
\RequirePackage[left=\@marginleft,right=\@marginright,top=\@margintop,bottom=\@marginbottom,bindingoffset=\@bindingoffset]{geometry}
\RequirePackage{pgffor}
\RequirePackage{etoolbox}
\RequirePackage{stfloats}
\RequirePackage{cite}
\RequirePackage{caption}
\RequirePackage{multirow}
\RequirePackage{adjustbox}
\RequirePackage{longtable}
\RequirePackage{emptypage}

\setlength\LTleft{0pt}
\setlength\LTright{0pt}

\RequirePackage{fancyhdr}
\setlength{\headheight}{\baselineskip}
\renewcommand{\sectionmark}[1]{\markright{#1}}

\fancypagestyle{firstpage}{%
\fancyhf{} % clear all six fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{firstcoverpage}{%
\fancyhf{} % clear all six fields
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{%
\fancyhf{} % clear all six fields
\fancyhead[LE,RO]{\textbf{\thepage}}
\fancyhead[LO,RE]{\nouppercase{\rightmark}}
\renewcommand{\headrulewidth}{0.7pt}
\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{followingpage}

\linespread{1.3}

\makeatletter
\renewcommand\maketitle{
    \begin{titlepage}
    {
        \linespread{1.3}
        %\fontsize{15}{18}\selectfont{}
        \thispagestyle{firstpage}
        \begin{center}
        {
            \Large{2\textsuperscript{nd} Single-cell \& Spatial Omics Workshop}\\[1.5cm]
            \Huge{\textbf{Abstract Book}}\\[8cm]
            \Large{Kyung-Ahm Engineering Building\\Pusan National University\\Yangsan, Korea}\\[1cm]
            \Large{January 22-23, 2024}
        }
        \end{center}
    }
    \end{titlepage}%
    \setcounter{footnote}{0}%
}
\makeatother

\newenvironment{coverpage}[1]
{
    \restoregeometry
    \cleardoublepage
    \thispagestyle{firstcoverpage}
    \renewcommand{\sectionmark}[1]{\markright{#1}{}}
    \chaptermark{#1}\sectionmark{#1}
    \null\vskip 50pt
    \begin{center}
    \section*{#1}
    \addcontentsline{toc}{chapter}{#1}
    \null\vskip 20pt
    \end{center}
}{
    \newpage
}

\newenvironment{timetable}
{
    \cleardoublepage
    \pagestyle{firstcoverpage}
    \newgeometry{left=10mm,right=10mm,top=10mm,bottom=20mm}
    \fancyfootoffset{0pt}
}{
    \newpage
}

\newenvironment{fullpage}
{
    \cleardoublepage
    \pagestyle{firstpage}
    \newgeometry{left=0mm,right=0mm,top=0mm,bottom=0mm,bindingoffset=0mm}
}{
    \newpage
}

\newenvironment{abstract}
{
    \cleardoublepage
    \pagestyle{firstcoverpage}
}

% https://tex.stackexchange.com/questions/95838/how-to-write-a-perfect-equation-parameters-description
\RequirePackage{amsmath}
\RequirePackage{array}
\newenvironment{conditions}
  {\par\vspace{\abovedisplayskip}\noindent\begin{tabular}{>{$}l<{$} @{${}:{}$} l}}
  {\end{tabular}\par\vspace{\belowdisplayskip}\vspace{\baselineskip}}