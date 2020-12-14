%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% new-aiaa.cls, v1.2, 2018/01/10
% Developed by Overleaf
% 
% This class file enables authors to prepare papers
% for submission to AIAA Technical Journals and
% Conferences.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\ProvidesClass{byu-aero}[2019/11/08, v1.0]

\newif\if@proposal
% \newif\if@report
\DeclareOption{proposal}{\@proposaltrue}
% \DeclareOption{report}{\@reporttrue}

\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass[10pt]{article}


\RequirePackage[usenames,dvipsnames]{color}% This loads a package that allows extra colors for links.
\definecolor{BYUblue}{RGB}{0,46,93}
\definecolor{BYUbluelite}{RGB}{221,227,233}
\definecolor{BYUbluemid}{RGB}{151,169,189}
\definecolor{BYUred}{RGB}{162, 0, 0}
%tikz colors:
\newcommand{\BYUblue}{rgb,255:red,0; green,46; blue,93}
\newcommand{\BYUbluelite}{rgb,255:red,221; green,227; blue,233}
\newcommand{\BYUbluemid}{rgb,255:red,151; green,169; blue,189}
\newcommand{\BYUred}{rgb,255:red,162; green,0; blue,0}


\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage{newtxtext,newtxmath}


\RequirePackage[letterpaper,
				left=0.35in,
				right=0.35in,
				top=0.75in,
				bottom=0.5in,
				footskip=0.25in,
				headheight=0.75in,
				headsep=0.125in,
				marginparsep=0pt,
%				showframe
				]{geometry}


\RequirePackage{enumitem}
\setlist{labelindent=\parindent,leftmargin=*,nosep}
\setlist[enumerate]{label={\arabic*)}}


\RequirePackage[symbol*]{footmisc}

%This allows the insertion of full page pdfs
\RequirePackage{pdfpages}


\RequirePackage{setspace}
\spacing{1.5}


\RequirePackage[explicit]{titlesec}
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\thesection.\Alph{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\titleformat{\section}
  {\color{BYUblue}\bfseries\singlespacing}
  {\thesection.\space}{0pt}{#1}[]
\titlespacing{\section}{0pt}{0.0\baselineskip}{0pt}
\titleformat{\subsection}
  {\color{BYUblue}\normalsize\bfseries\singlespacing}
  {\Alph{subsection}.\space}{0pt}{#1}[]
\titlespacing{\subsection}{1em}{0.0\baselineskip}{0pt}
\titleformat{\subsubsection}[runin]
	{\normalfont\normalsize\slshape\color{\BYUblue}}
	{}{0pt}{#1}[]
\titlespacing{\subsubsection}{2em}{0.0\baselineskip}{1ex}
\titlespacing{\paragraph}{2em}{0.0\baselineskip}{1ex}


\RequirePackage[tableposition=top,font=small,bf]{caption}
\renewcommand{\figurename}{\color{\BYUblue}Figure}
\renewcommand{\thefigure}{\color{\BYUblue}\arabic{figure}}
\renewcommand{\tablename}{\color{\BYUblue}Table}
\renewcommand{\thetable}{\color{\BYUblue}\arabic{table}}
\captionsetup*{labelsep=space}
\RequirePackage{subcaption}
\renewcommand{\thesubfigure}{\color{\BYUblue}\alph{subfigure})}
\captionsetup[subfigure]{labelsep=space,labelformat=simple}

\renewcommand{\arraystretch}{1.2}


\setlength{\abovedisplayskip}{\baselineskip}
\setlength{\belowdisplayskip}{\baselineskip}
\setlength{\abovedisplayshortskip}{\baselineskip}
\setlength{\belowdisplayshortskip}{\baselineskip}

%BIBILOGRAPHY
\RequirePackage[sort&compress,numbers]{natbib}
% \bibliographystyle{aiaa}
\bibliographystyle{new-aiaa}
\renewcommand{\bibfont}{\small}

%IN TEXT REFERENCES/HYPERLINKS
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	citecolor=BYUblue,
	linkcolor=BYUblue,
	urlcolor=BYUblue,
	filecolor=BYUblue,
	linktoc=all}
\usepackage[noabbrev]{cleveref}


%CUSTOM ADDED STUFF
%FIGURES
\RequirePackage[]{graphicx}
\graphicspath{{./figures/}}
\RequirePackage{wrapfig}

%tables
\RequirePackage[table]{xcolor}
%\usepackage{booktabs}

%%TIKZ
\usepackage{tikz}
%Flowchart option 1
\usetikzlibrary{trees}
%Flowchart option 2
\RequirePackage[edges]{forest}
\usetikzlibrary{arrows.meta}% arrows is deprecated
\tikzset{% \tikzstyle is deprecated
	block/.style={rectangle, draw=\BYUblue, fill=\BYUbluelite, text=\BYUblue, text width=10em, text centered, rounded corners, minimum height=4em},
	line/.style={draw, very thick, color=\BYUblue, -Stealth},
}

%Organization Chart:

\tikzstyle{block} = 
[
rectangle
, draw=\BYUblue
, fill=\BYUbluelite
, text width=7em
, text centered
, node distance=0cm
, rounded corners
, minimum height=1.5em
]

\tikzstyle{block2} = 
[
rectangle
, draw=\BYUblue
, fill=\BYUbluelite
, text width=5em
, text centered
, node distance=0cm
, rounded corners
, minimum height=1.5em
]

\tikzstyle{line} = 
[
draw
]


%GANTT CHART
\usepackage{pgfgantt}
\ganttset{
	time slot format=isodate,
	time slot unit=day,
	x unit=0.025cm,
	y unit title=0.4cm,
	y unit chart=0.3cm,
	hgrid,
	canvas/.append style={draw=\BYUblue},
	%
	title label font=\bfseries\scriptsize,
	title height=1,
	title/.style={fill=\BYUbluelite,draw=\BYUblue},
	%
	group/.append style={fill=\BYUbluemid,draw=\BYUblue},
	group top shift=0.25,
	group height=.25,
	group right peak tip position=0.0,
	group left peak tip position=0.0,
	group peaks width=2.0,
	group peaks height=0.25,
	group label font = \bfseries\footnotesize,
	%
	bar/.append style={fill=\BYUblue,draw=\BYUblue},
	bar label font=\footnotesize,
	bar height = 0.25,
%	bar top shift = 0.25,
	progress label text = {},
	%
	milestone/.append style={fill=\BYUbluelite,draw=\BYUblue,xscale=12},
	milestone height = 0.95,
	milestone top shift = 0.0,
	milestone label font = \itshape\footnotesize
}
%XDSM Chart
\RequirePackage{amsfonts}
%\RequirePackage{amssymb}
% Define the set of tikz packages to be included in the architecture diagram document
\usetikzlibrary{arrows,chains,positioning,scopes,shapes.geometric,shapes.misc,shadows} 
% Set the border around all of the architecture diagrams to be tight to the diagrams themselves
% (i.e. no longer need to tinker with page size parameters)
%\RequirePackage[active,tightpage]{preview}
%\PreviewEnvironment{tikzpicture}
%\setlength{\PreviewBorder}{5pt}

%mathpackages
\RequirePackage{amsmath}
\RequirePackage{siunitx}
\RequirePackage{mathrsfs}
\newcommand{\vect}{\overset{\rightharpoonup}}
\RequirePackage{nicefrac}

%Header/Footer
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}   % simple control of headers and footers

\fancyhf{}
\lhead{\includegraphics[height=0.5in]{Logo5.png}}
\rhead{\ifthenelse{\isodd{\value{page}}}{\includegraphics[height=0.5in]{byu-logo.png}}{\includegraphics[height=0.5in]{dbf-logo.png}}}
\cfoot{\color{BYUblue} \underline{~~\thepage\ of \pageref{LastPage}~~}}
\fancyhfoffset[L]{0.2in}
\fancyhfoffset[R]{0.2in}
\pagestyle{fancy}

\fancypagestyle{tocpage}{\lhead{} \rhead{} \lfoot{} \rfoot{} \cfoot{\color{BYUblue} \underline{~~\thepage\ of \pageref{LastPage}~~}}}
\renewcommand{\headrulewidth}{0pt} % This eliminates the line at the top of pages.

\newcommand\NextYear{%
   \advance\year by 1 \the\year\advance\year by -1}
   
\if@proposal %
\chead{
\parbox[b][3em][t]{0.75\textwidth}{
\centering
\Large{\color{BYUblue} Brigham Young University Aeronautics Club}\\
\small{\NextYear~AIAA Design Build Fly Competition Proposal}}
}
\fi

%Fix spacing in Table of Contents
\RequirePackage{titletoc}
\titlecontents{section}[3em]
{\addvspace{1em}\color{BYUblue}\bfseries}
{\contentslabel{3em}}
{\hspace*{0em}}
{\hfill\contentspage}
