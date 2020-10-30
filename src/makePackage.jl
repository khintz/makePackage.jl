module makePackage

using ArgParse
using PkgTemplates

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table s begin
        "makePackage"
            help = "a positional argument to tell a new package should be created"
            action = :command
        "showExample"
            help = "show examples of this program"
            action = :command
        "--packageName"
            help = "Set the name of your package"
            arg_type = String
            default = "juliatest"
        "--packageDir"
            help = "Set the directory where the package should be placed"
            arg_type = String
            default = "~/git"
        "--user"
            help = "Set the user for the new project"
            arg_type = String
            default = "Donald"
        "--authors"
            help = "Set the authors for the new project"
            arg_type = String
            default = "Donald"
        "--host"
            help = "Set the host for the new project"
            arg_type = String
            default = "github.com"
        # "--flag1"
        #     help = "an option without argument, i.e. a flag"
        #     action = :store_true
        end

 
    return parse_args(s)
end


function fmakePackage(packageName, packageDir, user, authors, host)
    println("creating ",packageName)

    t = Template(user=user, dir=packageDir, authors=authors, julia=v"1.5.2", host=host, 
                    plugins=[
                        License(; name="MIT", destination="LICENSE"),
                        Git(; manifest=true, ssh=true)
                        ])

    t(packageName)

end


function main()
    parsed_args = parse_commandline()
    
    if occursin("showExample", parsed_args["%COMMAND%"])
        println("julia makePackage.jl --packageName testjul --packageDir ~/git/ --user Duck --authors Duck --host github.com  makePackage")
        exit()
    end


    if occursin("makePackage", parsed_args["%COMMAND%"])
        fmakePackage(parsed_args["packageName"], 
                     parsed_args["packageDir"], 
                     parsed_args["user"],
                     parsed_args["authors"],
                     parsed_args["host"])

        exit()
    end


end

main()

end
