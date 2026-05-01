using Barrier

# ------------------------------------ #

using Library: Library, @st, >>

Library.GR[] = const GR = Library.Graph()

@st Body "bo"

@st Airway "ba"

@st Gut "ba"

@st Skin "ba"

@st Input1 "np"

@st Input2 "np"

@st Input3 "np"

@st Input4 "np"

@st Input5 "np"

@st Input6 "np"

@st Reaction1 "re"

@st Reaction2 "re"

@st Reaction3 "re"

@st Reaction4 "re"

@st Reaction5 "re"

@st Reaction6 "re"

@st Output "ou"

(Input1, Airway) >> Reaction1

(Input2, Airway) >> Reaction2

(Input3, Gut) >> Reaction3

(Input4, Gut) >> Reaction4

(Input5, Skin) >> Reaction5

(Input6, Skin) >> Reaction6

(Reaction1, Reaction2, Reaction3, Reaction4, Reaction5, Reaction6, Body) >>
Output

Library.write_graph(
    joinpath(Barrier.P2, "graph.html"),
    GR,
    "";
    d2_ = (
        Dict(
            "selector" => ".$st",
            "style" =>
                Dict("height" => nu, "width" => nu, "background-color" => he),
        ) for (st, nu, he) in (
            ("bo", 240, Library.PE),
            ("ba", 200, Library.AK),
            ("np", 40, Library.MI),
            ("re", 80, Library.FA),
            ("ou", 160, Library.TU),
        )
    ),
    n1 = 96,
    di = Dict("name" => "breadthfirst", "roots" => ("Output",)),
)
