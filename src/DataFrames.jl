VERSION >= v"0.4.0-dev+6521" && __precompile__(true)

module DataFrames

##############################################################################
##
## Dependencies
##
##############################################################################

using Compat
import Compat.String
using Reexport
@reexport using StatsBase
@reexport using DataArrays
using GZip
using SortingAlgorithms

using FileIO  # remove after read_rda deprecation period

using Base: Sort, Order
import Base: ==, |>

##############################################################################
##
## Exported methods and types (in addition to everything reexported above)
##
##############################################################################

export @~,
       @csv_str,
       @csv2_str,
       @tsv_str,
       @wsv_str,

       AbstractDataFrame,
       AbstractContrasts,
       DataFrame,
       DataFrameRow,
       Formula,
       GroupApplied,
       GroupedDataFrame,
       ModelFrame,
       ModelMatrix,
       SubDataFrame,
       EffectsCoding,
       DummyCoding,
       HelmertCoding,
       ContrastsCoding,

       aggregate,
       by,
       coefnames,
       colwise,
       combine,
       complete_cases,
       complete_cases!,
       setcontrasts!,
       deleterows!,
       describe,
       eachcol,
       eachrow,
       eltypes,
       groupby,
       melt,
       meltdf,
       names!,
       ncol,
       nonunique,
       nrow,
       nullable!,
       order,
       pivot,
       pool,
       pool!,
       printtable,
       readtable,
       rename!,
       rename,
       showcols,
       stack,
       stackdf,
       unique!,
       unstack,
       writetable,

       # Remove after deprecation period
       read_rda

##############################################################################
##
## Load files
##
##############################################################################

if VERSION < v"0.5.0-dev+2023"
    _displaysize(x...) = Base.tty_size()
else
    const _displaysize = Base.displaysize
end

for (dir, filename) in [
        ("other", "utils.jl"),
        ("other", "index.jl"),

        ("abstractdataframe", "abstractdataframe.jl"),
        ("dataframe", "dataframe.jl"),
        ("subdataframe", "subdataframe.jl"),
        ("groupeddataframe", "grouping.jl"),
        ("dataframerow", "dataframerow.jl"),

        ("abstractdataframe", "iteration.jl"),
        ("abstractdataframe", "join.jl"),
        ("abstractdataframe", "reshape.jl"),

        ("abstractdataframe", "io.jl"),
        ("dataframe", "io.jl"),

        ("abstractdataframe", "show.jl"),
        ("groupeddataframe", "show.jl"),
        ("dataframerow", "show.jl"),

        ("abstractdataframe", "sort.jl"),
        ("dataframe", "sort.jl"),

        ("statsmodels", "contrasts.jl"),
        ("statsmodels", "formula.jl"),
        ("statsmodels", "statsmodel.jl"),

        ("", "deprecated.jl")
    ]

    include(joinpath(dir, filename))
end

end # module DataFrames
