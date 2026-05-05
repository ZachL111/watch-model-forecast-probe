module PortfolioCore (Signal(..), score, classify) where

data Signal = Signal
  { demand :: Int
  , capacity :: Int
  , latency :: Int
  , risk :: Int
  , weight :: Int
  } deriving (Eq, Show)

threshold :: Int
threshold = 172

riskPenalty, latencyPenalty, weightBonus :: Int
riskPenalty = 7
latencyPenalty = 4
weightBonus = 6

score :: Signal -> Int
score signal =
  demand signal * 2 + capacity signal + weight signal * weightBonus
    - latency signal * latencyPenalty - risk signal * riskPenalty

classify :: Signal -> String
classify signal = if score signal >= threshold then "accept" else "review"
