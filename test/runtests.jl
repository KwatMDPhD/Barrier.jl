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
    joinpath(Barrier.P2, "Graph.html"),
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

for (st, he, st_, N) in (
    (
        "Blood",
        Library.AK,
        [
            "Antigen recognition",
            "Transmigration",
            "Hematopoiesis",
            "The complement system",
            "Immune memory",
            "Humoral response",
            "Cytotoxicity",
            "Clonal selection",
            "Adaptive immunity",
            "Antigen presentation",
            "Innate immunity",
            "Self tolerance",
        ],
        [
            1 1.4
            1 1
            1 1
            1 1.1
            1 1.2
            1 0.9
            1 1.1
            1 0.9
            1 1
            1 1.1
            1 1.2
            1 1.1
        ],
    ),
    (
        "Airway",
        Library.AO,
        [
            "Barrier",
            "Stem",
            "Circulation",
            "Repair",
            "Innate immunity",
            "Adaptive immunity",
        ],
        [
            1 0.8
            1 0.9
            1 1.1
            1 1.3
            1 1.4
            1 1.1
        ],
    ),
    (
        "Gut",
        Library.MI,
        [
            "Barrier",
            "Leak",
            "Stem",
            "Circulation",
            "Repair",
            "Innate immunity",
            "Adaptive immunity",
            "Tolerance",
        ],
        [
            1 0.8
            1 1.4
            1 0.9
            1 1.1
            1 1.3
            1 1.4
            1 1.1
            1 0.7
        ],
    ),
    (
        "Skin",
        Library.HU,
        [
            "Barrier",
            "Hydration",
            "Stem",
            "Circulation",
            "Repair",
            "Innate immunity",
            "Adaptive immunity",
        ],
        [
            1 1.1
            1 1.2
            1 1.1
            1 1.1
            1 0.9
            1 1.1
            1 1.3
        ],
    ),
)

    Library.write_radar(
        joinpath(Barrier.P2, "Immunogram $st.html"),
        st_,
        ["Healthy", "Sample"],
        N,
        ("#c6c2b6", he),
        Dict(
            "title" => Dict("text" => "$st Immunogram"),
            "polar" =>
                Dict("angularaxis" => Dict("tickfont" => Dict("size" => 32))),
            "legend" => Dict("font" => Dict("size" => 32)),
        ),
    )

end
