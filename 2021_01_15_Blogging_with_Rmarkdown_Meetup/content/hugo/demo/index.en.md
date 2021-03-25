---
title: Notes from the demo
menuTitle: Demo
weight: 5
slides: true
output: hugodown::md_document
rmd_hash: d2476464d8fe10a7

---

Mostly following [Alison Hill's blogdown tutorial](https://alison.rbind.io/post/new-year-new-blogdown/) but with a different theme by... Alison Hill. :grin:

-   install the blogdown package [`install.packages("blogdown")`](https://rdrr.io/r/utils/install.packages.html)

-   create a new empty RStudio project

-   [`blogdown::new_site(theme = "apreshill/blogophonic")`](https://rdrr.io/pkg/blogdown/man/hugo_cmd.html)

-   use my Rprofile options from snippets

-   [`blogdown::serve_site()`](https://rdrr.io/pkg/blogdown/man/serve_site.html)

-   look where things live e.g. data/ vs content/.

-   [`blogdown::new_post(title = "Hi Hugo", ext = '.Rmarkdown', subdir = "blog")`](https://rdrr.io/pkg/blogdown/man/hugo_cmd.html)

-   write and knit

-   [`blogdown::check_site()`](https://rdrr.io/pkg/blogdown/man/check_site.html)

-   [`usethis::use_git()`](https://usethis.r-lib.org/reference/use_git.html)

-   in shell, move master branch to main. `git branch -m main master`

-   [`usethis::use_github()`](https://usethis.r-lib.org/reference/use_github.html)

-   Set up Netlify

-   Show Hugo theme gallery <a href="https://themes.gohugo.io/" class="uri">https://themes.gohugo.io/</a>

