using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Dtos.Stock;
using api.Models;

namespace api.Mappers
{
    public static class StockMappers
    {
        public static StockDtos ToStockDtos(this Stocks stockModel)
        {
            return new StockDtos
            {
                Id = stockModel.Id,
                Symbol = stockModel.Symbol,
                CompanyName = stockModel.CompanyName,
                Purchase = stockModel.Purchase,
                LastDiv = stockModel.LastDiv,
                Industry = stockModel.Industry,
                MarketCap = stockModel.MarketCap
            };
        }

        public static Stocks ToStockFromCreateDTO(this CreateStockRequestDtos StockDtos)
        {
            return new Stocks
            {
                Symbol = StockDtos.Symbol,
                CompanyName = StockDtos.CompanyName,
                Purchase = StockDtos.Purchase,
                LastDiv = StockDtos.LastDiv,
                Industry = StockDtos.Industry,
                MarketCap = StockDtos.MarketCap
            };
        }
    }
}