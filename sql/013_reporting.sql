– For debugging (remove next 4 lines after pasting to dataset) –

DECLARE @DateFrom Date

DECLARE @DateTo Date

SET @DateFrom = '2014-11-01'

SET @DateTo = '2014-12-31'

– End debugging script –

 

SELECT    

      DATEPART(Hour, TimeStart) AS ReportYear

    , DATEPART(Month, TimeStart) AS ReportMonth

    , DATEPART(Day, TimeStart) AS ReportDay

    , DATEPART(Hour, TimeStart) AS ReportHour

    , Type

    , COUNT(Name) AS ExecutionCount

    , AVG(TimeDataRetrieval) AS TimeDataRetrievalAvg

    , AVG(TimeProcessing) AS TimeProcessingAvg

    , AVG(TimeRendering) AS TimeRenderingAvg

    , AVG(ByteCount) AS ByteCountAvg

    , SUM([RowCount]) AS RowCountSum

FROM

(

    SELECT TimeStart, Catalog.Type, Catalog.Name, TimeDataRetrieval,

  TimeProcessing, TimeRendering, ByteCount, [RowCount]

    FROM

    Catalog INNER JOIN ExecutionLog ON Catalog.ItemID =

       ExecutionLog.ReportID LEFT OUTER JOIN

    Users ON Catalog.CreatedByID = Users.UserID

    WHERE ExecutionLog.TimeStart BETWEEN @DateFrom AND @DateTo

) AS RE

GROUP BY

      DATEPART(Hour, TimeStart)

    , DATEPART(Month, TimeStart)

    , DATEPART(Day, TimeStart)

    , DATEPART(Hour, TimeStart)

    , Type

ORDER BY

      ReportYear

    , ReportMonth

    , ReportDay

    , ReportHour

    , Type

