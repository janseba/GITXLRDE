Sub XLCode()
Dim sql As String, fromPlan As String, toPlan As String, country As String, periodFrom As String, periodTo As String
fromPlan = GetPar([A1], "From Plan Version=")
toPlan = GetPar([A1], "To Plan Version=")
periodFrom = GetPar([A1], "From Period=")
periodTo = GetPar([A1], "To Period=")
    If GetSQL("SELECT Locked FROM sources WHERE Source = " & Quot(toPlan)) = "y" Then
        XLImp "ERROR", "The plan version has been locked for input": Exit Sub
    End If
country = GetPar([A1], "Country=")
sql = "DELETE FROM tblFacts WHERE PlanVersion = " & Quot(toPlan) & " AND Country = " & Quot(country) & _
	" AND Period BETWEEN " & Quot(periodFrom) & " AND " & Quot(periodTo)
XLImp sql, "Delete old plan data ..."
sql = "INSERT INTO tblFacts ([Country],[PlanVersion],[Period],[SourceType],[Forecast],[SKU],[Customer],[PromoNonPromo],[OnOffInvoice],[Volume],[Drinks],[tDiscs]," & _
		"[Packages],[FAP1],[LPA],[Discount1Perc],[Discount1Eur],[" & _
		"Discount1Fix],[Discount2PercNIS],[Discount2PercFAP1],[Discount2Eur],[Discount2Fix],[Discount3Fix],[Discount3PercNIS],[Discount3PercFAP1],[" & _
		"Discount3Eur],[Discount4PercFAP1],[Discount4PercNIS],[Discount4Eur],[Discount4Fix],[Discount5PercFAP1],[Discount5PercNIS],[Discount5Eur],[" & _
		"Discount5Fix],[EcoTax],[CoffeeTax],[MB],[DisplayCosts],[AdvWorkingMedia],[AdvNonWorkingMedia],[BrewerSupport],[PromotionOther],[Shipping],[Warehouse],[" & _
		"Selling],[OtherGA],[105_GOSFAP1],[14_3TermofPayment],[102_PPROnInv],[101_SalesReturnsOnInv],[104_TAEfficiencyOnInv],[103_TPROnInv],[CPIncentivesOnInv],[" & _
		"106_TABMCOnInv],[107_TABDFOnInv],[102_PPROffInvTAS],[101_SalesReturnsOffInvTAS],[104_TAEfficiencyOffInvTAS],[103_TPROffInvTAS],[" & _
		"CPIncentivesOffInvTAS],[106_TABMCOffInvTAS],[107_TABDFOffInvTAS],[102_PPROffInvFIN],[101_SalesReturnsOffInvFIN],[104_TAEfficiencyOffInvFIN],[" & _
		"103_TPROffInvFIN],[CPIncentivesOffInvFIN],[106_TABMCOffInvFIN],[107_TABDFOffInvFIN],[15_2SpecialOccasion],[17_1OneListFee],[CostOfSales],[" & _
		"MBAdjustments],[GreenDot],[18Royaltieslncome3rdParty],[22_3_5Extracosts],[22_5EcoTax],[22_6ExciseTax],[28_1Royalties]) " & _
		"SELECT [Country]," & Quot(toPlan) & ",[Period],[SourceType],[Forecast],[SKU],[Customer],[PromoNonPromo],[OnOffInvoice],[Volume],[Drinks],[tDiscs]," & _
		"[Packages],[FAP1],[LPA],[Discount1Perc],[Discount1Eur],[" & _
		"Discount1Fix],[Discount2PercNIS],[Discount2PercFAP1],[Discount2Eur],[Discount2Fix],[Discount3Fix],[Discount3PercNIS],[Discount3PercFAP1],[" & _
		"Discount3Eur],[Discount4PercFAP1],[Discount4PercNIS],[Discount4Eur],[Discount4Fix],[Discount5PercFAP1],[Discount5PercNIS],[Discount5Eur],[" & _
		"Discount5Fix],[EcoTax],[CoffeeTax],[MB],[DisplayCosts],[AdvWorkingMedia],[AdvNonWorkingMedia],[BrewerSupport],[PromotionOther],[Shipping],[Warehouse],[" & _
		"Selling],[OtherGA],[105_GOSFAP1],[14_3TermofPayment],[102_PPROnInv],[101_SalesReturnsOnInv],[104_TAEfficiencyOnInv],[103_TPROnInv],[CPIncentivesOnInv],[" & _
		"106_TABMCOnInv],[107_TABDFOnInv],[102_PPROffInvTAS],[101_SalesReturnsOffInvTAS],[104_TAEfficiencyOffInvTAS],[103_TPROffInvTAS],[" & _
		"CPIncentivesOffInvTAS],[106_TABMCOffInvTAS],[107_TABDFOffInvTAS],[102_PPROffInvFIN],[101_SalesReturnsOffInvFIN],[104_TAEfficiencyOffInvFIN],[" & _
		"103_TPROffInvFIN],[CPIncentivesOffInvFIN],[106_TABMCOffInvFIN],[107_TABDFOffInvFIN],[15_2SpecialOccasion],[17_1OneListFee],[CostOfSales],[" & _
		"MBAdjustments],[GreenDot],[18Royaltieslncome3rdParty],[22_3_5Extracosts],[22_5EcoTax],[22_6ExciseTax],[28_1Royalties] FROM tblFacts " & _
		"WHERE PlanVersion = " & Quot(fromPlan) & " AND Country = " & Quot(country) & _ 
		" AND Period BETWEEN " & Quot(periodFrom) & " AND " & Quot(periodTo)
XLImp sql, "Copy plan ..."
End Sub