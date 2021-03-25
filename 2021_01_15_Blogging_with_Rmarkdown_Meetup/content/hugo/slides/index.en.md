---
outputs:
- Reveal
title: Hugo & hugodown
hidden: true
layout: list
weight: 1
output: hugodown::md_document
countdown: true
rmd_hash: 6b3445f43e18c221

---

Hugo (blog/hugo)down
====================

A powerful static generator, usable with R Markdown.

------------------------------------------------------------------------

[Hugo](https://gohugo.io/)
==========================

Powerful and fast static generator

Only an .exe to install :tada:

------------------------------------------------------------------------

[blogdown](https://github.com/rstudio/blogdown/)
================================================

[R :package:](https://github.com/rstudio/blogdown/)

-   R Markdown output formats

-   Handy helpers, possibility to create custom workflows to process your website as you see fit

-   RStudio add-in to create posts

Active development, many users and educators.

------------------------------------------------------------------------

[hugodown](https://hugodown.r-lib.org/)
=======================================

[R :package:](https://hugodown.r-lib.org/)

-   An R Markdown output format

-   Handy helpers

Experimental. Markdown first. I use it for this website.

------------------------------------------------------------------------

From Rmd to website
===================

Under the hood

{{<mermaid align="left">}}
graph LR;
    A[Rmd] --> |"R ( blogdown/hugodown :package:) </br> & Pandoc"| B{md}
    B --> |"Hugo (Goldmark, Chroma)"| C[HTML]
{{< /mermaid >}}

<small>Inspired by [Emi Tanaka's post](https://emitanaka.org/r/posts/2018-12-12-scientific-and-technical-blogging-radix-vs-blogdown/)</small>

------------------------------------------------------------------------

From Rmd to website
===================

What you do

{{<mermaid align="left">}}
graph LR;
    A[Rmd] --> |":large_blue_circle: knit button"| B{md}
    B --> |"hugo build (locally or cloud)"| C[HTML]
{{< /mermaid >}}

:mountain_cableway: Time for a demo!

[Notes on the course website](/hugo/demo/)

------------------------------------------------------------------------

Scientific Rmd Blog Checklist

-   [x] R Markdown
-   [x] Syntax highlighting
-   [x] Modern
-   [x] .bib
-   \[?\] Citation for posts (possible but custom layout)
-   [x] Equations

------------------------------------------------------------------------

Sustainability: blogdown
========================

Created by:

<div class="highlight">

Yihui Xie ), Christophe Dervieux ), Alison Presmanes Hill \[aut\] ()

</div>

Used for [Alison Hill's website](https://alison.rbind.io), in particular.

[Active development](https://github.com/rstudio/blogdown/).

------------------------------------------------------------------------

Sustainability: hugodown
========================

Created by:

<div class="highlight">

Hadley Wickham \[aut, cre\]

</div>

Used for [tidyverse.org](https://tidyverse.org), in particular.

[Off and on development](https://github.com/r-lib/hugodown/).

------------------------------------------------------------------------

Limitations?
============

-   blogdown docs are outdated (book update planned). Markdown output not a first-class citizen yet.

-   hugodown is a minimal WIP package.

-   Hugo changes a lot (but both blogdown and hugodown protect your projects from that)

------------------------------------------------------------------------

So blogdown or hugodown?
========================

blogdown is more mainstream, ultimately it will have more features and docs.

hugodown is more for DIY minimal workflows.

------------------------------------------------------------------------

Further resources
=================

[Listed on the course website](/hugo/further-resources/) :ledger:

------------------------------------------------------------------------

Questions, comments?
====================

Write them in the chat!

------------------------------------------------------------------------

Time for a break :tea:
======================

<!--html_preserve-->

<div id="timer_hugo" class="countdown" style="top:100;left:0;" data-warnwhen="0">

<code class="countdown-time"><span class="countdown-digits minutes">05</span><span class="countdown-digits colon">:</span><span class="countdown-digits seconds">00</span></code>

</div>

<!--/html_preserve-->

