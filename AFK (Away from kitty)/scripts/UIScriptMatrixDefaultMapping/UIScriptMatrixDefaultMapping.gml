function UIScriptMatrixDefaultMapping(){
    return {
        map: "callback",
        params: [],
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