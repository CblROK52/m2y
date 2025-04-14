SELECT 
    (SUM(COALESCE(b.CheckOutDate, b.CheckInDate + 1) - b.CheckInDate) * 100.0 / 
    (COUNT(r.RoomFundId) * 30)) AS occupancy_percentage
FROM 
    Booking b
JOIN 
    RoomFund r ON b.RoomFundId = r.RoomFundId
WHERE 
    b.StatusId = 1;