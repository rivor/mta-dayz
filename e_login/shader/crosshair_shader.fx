texture crosshair_texture; 
technique TexReplace 
{ 
    pass P0 
    { 
        Texture[0] = crosshair_texture;  
    } 
} 