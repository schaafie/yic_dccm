# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     YicDccm.Repo.insert!(%YicDccm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias YicDccm.ContentManager.ContentType
alias YicDccm.Repo

Repo.insert! %ContentType{ name: "Base HTML", definition: "[{ name:"basehtml", type:"base", handler: "simple-editor", format: "" }]", instantiable: false }
Repo.insert! %ContentType{ name: "Rich HTML", definition: "[{ name:"richhtml", type:"base", handler: "rich-editor", format: "" }]", instantiable: false }
Repo.insert! %ContentType{ name: "mail", definition: "[{ name:"mail", type:"base", handler: "", format: "" }]", instantiable: false }
Repo.insert! %ContentType{ name: "date", definition: "[{ name:"date", type:"base", handler: "", format: "" }]", instantiable: false }
Repo.insert! %ContentType{ name: "phone", definition: "[{ name:"phone", type:"base", handler: "", format: "" }]", instantiable: false }
