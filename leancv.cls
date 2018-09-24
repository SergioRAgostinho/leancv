% Copyright 2018 Sérgio Agostinho

% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{leancv}[2018/09/20 A Modern Tabular Looking Curriculum Vitae Class]


%% Options Section
% Article
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{11pt}

\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{a4paper}

% Fallback
\DeclareOption*{
  \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

\ProcessOptions

\LoadClass{article}


%% Dependencies
\RequirePackage[margin=1in]{geometry}
\RequirePackage{xparse}
\RequirePackage{longtable}
\RequirePackage{amssymb}

\RequirePackage[scaled]{helvet}
\renewcommand\familydefault{\sfdefault}
\RequirePackage[T1]{fontenc}

\RequirePackage[dvipsnames]{xcolor}
\colorlet{DarkGray}{Black!70!}
\definecolor{LightBlue}{HTML}{52ADC8}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{calc}

\RequirePackage{hyperref}
\hypersetup{
    colorlinks = true,
    linkbordercolor = {white},
    urlcolor= {LightBlue}
}

%% New Environments and commands

% Inserts a photo at the upper corner of the page. It ignore completely text wrapping.
\newcommand\profilephoto[1]{%
	\begin{tikzpicture}[remember picture,overlay]
	  \node[anchor=north east,inner sep=0pt] at ($(current page.north east)- (1.2in, 1in)$) {
	     \includegraphics[height=4cm]{#1}
	  };
	\end{tikzpicture}
}


% The main environment which sets up the tabular feel
\newenvironment{leancv}{
	%% Specific commands to the environment

	% A generic entry
	% Usage:
	%   \entry[Name]{John Doe}
	\newcommand{\entry}[2][ ]{##1 & \textcolor{DarkGray}{##2} \\}

	% A job specific entry.
	% Usage:
	%	\jobentry{title}{start date - end date}{employer}{description}
	\newcommand{\jobentry}[4]{
		$\blacktriangleright$ \quad Position & \textcolor{DarkGray}{##1 - ##2} \\
		Employer & \textcolor{DarkGray}{##3} \\
		Description & \textcolor{DarkGray}{##4} \\
		 & \\
	}

	% A job specific entry. The star/asterisk variant does not add spacing
	% at the end.
	% Usage:
	%	\educationentry(*){study_field}{institution}{degree (- period)}
	\NewDocumentCommand\educationentry{ s m m m}{
		\def\content{
			$\blacktriangleright$ \quad Study Field & \textcolor{DarkGray}{##2} \\
			Institution & \textcolor{DarkGray}{##3} \\
			Degree Title & \textcolor{DarkGray}{##4} \\
		}
		\IfBooleanTF{##1}{%
			\content
		}{%
			\content
			 & \\
		}%
	}

	% Marks the beginning of a new section
	\renewcommand{\section}[1]{
		&  \\
		\textbf{##1} &  \\
	}


	%% Start environment

	% Start tabular environment
	\begin{longtable}{@{}r|p{.7\textwidth}@{}}

	\Large\textbf{Curriculum} & \Large\textbf{Vitae} \\
	&  \\
}{
	\end{longtable}
}

