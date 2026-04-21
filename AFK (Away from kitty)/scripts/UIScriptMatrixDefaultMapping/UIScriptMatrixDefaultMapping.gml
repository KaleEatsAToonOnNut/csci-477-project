function UIScriptMatrixDefaultMapping(){
    return {
        map: "callback",
        children: [
            {
                map: "image",
                obj: ObjectImage
            },
            {
                map: "text",
                obj: ObjectText
            },
            {
                map: "description",
                obj: ObjectText
            }
        ]
    }
}