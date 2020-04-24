using HCIDatasets
using Documenter

makedocs(;
    modules=[HCIDatasets],
    authors="Miles Lucas <mdlucas@hawaii.edu> and contributors",
    repo="https://github.com/mileslucas/HCIDatasets.jl/blob/{commit}{path}#L{line}",
    sitename="HCIDatasets.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
