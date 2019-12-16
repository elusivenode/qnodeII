select coalesce(cast(sec_child.UnitisedPortfolioId as varchar) + '_' + cast(pos.FundId as varchar)  + '_' + cast(pos.PortfolioId as varchar), 
		cast(pos.SecurityId as varchar) + '_' + cast(pos.FundId as varchar)  + '_' + cast(pos.PortfolioId as varchar)) as NodeId,
	sec_child.SecurityName,
	pos.MarketValueTotalBase,
	pos.ExposureBase,
	pos.FundId,
	pos.PortfolioId
from CuriumData_prod.Master.Position pos
	left join CuriumData_prod.Master.Security sec_child
		on pos.SecurityId = sec_child.SecurityId
where pos.BusinessDate = '20191210'
and pos.SecurityId != 8551
order by coalesce(cast(sec_child.UnitisedPortfolioId as varchar) + '_' + cast(pos.FundId as varchar)  + '_' + cast(pos.PortfolioId as varchar), 
		cast(pos.SecurityId as varchar) + '_' + cast(pos.FundId as varchar)  + '_' + cast(pos.PortfolioId as varchar))