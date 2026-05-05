import PortfolioCore

expect :: Bool -> IO ()
expect True = pure ()
expect False = error "fixture mismatch"

main :: IO ()
main = do
  let signalcase_1 = Signal 73 87 12 16 6
  expect (score signalcase_1 == 109)
  expect (classify signalcase_1 == "review")
  let signalcase_2 = Signal 90 90 17 12 8
  expect (score signalcase_2 == 166)
  expect (classify signalcase_2 == "review")
  let signalcase_3 = Signal 82 92 22 7 11
  expect (score signalcase_3 == 185)
  expect (classify signalcase_3 == "accept")
