function UIScriptMatrixItemMapping(){
    return {
        map: "effect",
        params: ["CURRENT_INDEX"],
        width: "2in",
        height: "1in",
        children: [
            {
                map: "sprite",
                obj: ObjectImage,
                width: "1qin",
                height: "1qin",
                ux: "1ein",
                uy: "1ein"
            },
            {
                map: "name",
                obj: ObjectText,
                width: "1hin",
                height: "1hin",
                ux: "1hin",
                uy: "3pc"
            },
            {
                map: "description",
                obj: ObjectText,
                width: "3hin",
                height: "1hin",
                ux: "1ein",
                uy: "1hin"
            }
        ]
    }
}