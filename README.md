# makePackage
Small utility to set up new Julia packages.\
It uses **PkgTemplates.jl** to generate the new package project and **argParse** to take input arguments.

This utility is made so that I don't need to remember all the different relevant settings in **PkgTemplates.jl**. There will probably come more features along the way.

## How to use?
The main script is **src/makePackage.jl**
Get a helping message by running either:
- `julia makePackage.jl -h`
- `julia makePackage.jl showExample`

A new project can be created with the following example:\
`julia makePackage.jl --packageName testjul --packageDir ~/git/ --user Duck --authors Duck --host github.com  makePackage`

All flags have a default value so only the *makePackage* command is necessary.