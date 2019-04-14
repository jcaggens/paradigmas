import Text.Printf

type Point     = (Float,Float)
type Rect      = (Point,Float,Float)
type Circle    = (Point,Float)


-------------------------------------------------------------------------------
-- Paletas
-------------------------------------------------------------------------------

rgbPalette :: Int -> [(Int,Int,Int)]
rgbPalette n = take n $ cycle [(255,0,0),(0,255,0),(0,0,255)]

greenPalette :: Int -> [(Int,Int,Int)]
greenPalette n = [(0,80+i*10,0) | i <- [0..n] ]

--bluePalette ::

--redPalette ::

--rainbowPalette ::

-------------------------------------------------------------------------------
-- Case1 : gera matriz de retângulos de cores diferentes
-------------------------------------------------------------------------------
genRectsInLine :: Int -> Int -> [Rect]
genRectsInLine n lines = [((m*(w+gap),l*(h+gap)),w,h) | m <- [0..fromIntegral (n-1)], l <- [0..fromIntegral(lines-1)]]
  where (w,h) = (50,50)
        gap = 10

printRect :: [Rect] -> IO()
printRect list = putStr (unlines $ ["   " ++ svgRect r (svgStyle (0, 0, 0)) | r <- list])


genCase1 :: IO ()  
genCase1 = printRect (genRectsInLine 20 2)

-------------------------------------------------------------------------------
-- Case2 : gera círculos dispostos sobre um círculo
-------------------------------------------------------------------------------

--calcPos :: 

--genCirc ::

--printCircle :: [Circle] -> IO()
--printCircle list = putStr 

--genCase2 :: IO () 
--genCase2 = printCircle ()

-------------------------------------------------------------------------------
-- Case3 : gera matriz com círculos sobrepostos
-------------------------------------------------------------------------------
--geraMatriz ::

--gerCirculos ::


--genCase3 :: IO () 

-------------------------------------------------------------------------------
-- Case4 : gera círculos dispostos sobre senoides
-------------------------------------------------------------------------------
--geraPos :: grafico do seno chama a geracir

--geraCirc :: Int -> [Circle]

--genCase4 :: IO () 

-------------------------------------------------------------------------------
-- Strings SVG
-------------------------------------------------------------------------------

-- Gera string representando retângulo SVG 
-- dadas coordenadas e dimensoes do retângulo e uma string com atributos de estilo
svgRect :: Rect -> String -> String 
svgRect ((x,y),w,h) style = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

svgCircle :: Circle -> String -> String 
svgCircle ((x,y),r) style = 
  printf "<circle cx='%.3f' cy='%.3f' r='%.2f' style='%s' />\n" x y r style

-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- Gera string com atributos de estilo para uma dada cor
-- Atributo mix-blend-mode permite misturar cores
svgStyle :: (Int,Int,Int) -> String
svgStyle (r,g,b) = printf "fill:rgb(%d,%d,%d); mix-blend-mode: screen;" r g b

-- Gera strings SVG para uma dada lista de figuras e seus atributos de estilo
-- Recebe uma funcao geradora de strings SVG, uma lista de círculos/retângulos e strings de estilo
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles

-------------------------------------------------------------------------------
-- Função principal que gera arquivo com imagem SVG
-------------------------------------------------------------------------------

main :: IO ()
main = do
  writeFile "caseX.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgRect rects (map svgStyle palette)
        rects = genCase1
        palette = greenPalette nrects
        nrects = 10
        (w,h) = (1500,500) -- width,height da imagem SVG


