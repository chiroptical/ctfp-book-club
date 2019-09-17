link0 :: String -> String
link0 = const "twitch.tv"

link1 :: String -> String
link1 = const "github.com"

link2 :: String -> String
link2 = const "zoom.us"

main :: IO ()
main = do
  let object0 = "google.com"
  let compositions = [ link0 . link1 . link2 $ object0
                     , link0 $ link1 . link2 $ object0
                     , link0 . link1 $ link2 object0
                     ]
  print $ all (== head compositions) $ tail compositions
