SELECT
	sps.TickerSymbol
	,SUM(CAST(sps.StockVolume AS BIGINT)) AS [Total Volume]
	INTO #tmp
FROM [Google Capstone Project DB].[dbo].[S&P500_Stocks] sps
GROUP BY
	sps.TickerSymbol


SELECT TOP 10
	 spc.TickerSymbol AS [Ticker Symbol]
	,spc.Name AS Stock
	,spc.Industry
	,spc.EBITDA
	,spc.RevenueGrowth AS [Revenue Growth]
	,spc.MarketCap AS [Market Cap]
	,spc.Country
	,[Total Volume]
FROM [Google Capstone Project DB].[dbo].[S&P500_Companies] spc
LEFT JOIN #tmp sps ON sps.TickerSymbol = spc.TickerSymbol
ORDER BY spc.RevenueGrowth DESC

DROP TABLE #tmp
