using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Data;
using api.Dtos.Stock;
using api.Mappers;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers
{
    [Route("api/route")]
    [ApiController]
    public class StockControllers : ControllerBase
    {
        private readonly ApplicationDBContext _context;
        public StockControllers(ApplicationDBContext context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult GetAll()
        {
            var stocks = _context.Stock.ToList().
                Select(s => s.ToStockDtos());


            return Ok(stocks);
        }
        [HttpGet("{id}")]
        public IActionResult GetById([FromRoute] int id)
        {
            var stock = _context.Stock.Find(id);

            if (stock == null)
            {
                return NotFound();
            }
            return Ok(stock.ToStockDtos());
        }
        [HttpPost]
        public IActionResult Create([FromBody] CreateStockRequestDtos stockDtos)
        {
            var stockModel = stockDtos.ToStockFromCreateDTO();
            _context.Stock.Add(stockModel);
            _context.SaveChanges();
            return CreatedAtAction(nameof(GetById), new { id = stockModel.Id }, stockModel.ToStockDtos());
        }
        [HttpPut]
        [Route("{Id}")]
        public IActionResult Update([FromRoute] int Id, [FromBody] UpdateStockRequestDtos updateDto)
        {
            var stockModel = _context.Stock.FirstOrDefault(x => x.Id == Id);
            if (stockModel == null)
            {
                return NotFound();
            }

            stockModel.Symbol = updateDto.Symbol;
            stockModel.CompanyName = updateDto.CompanyName;
            stockModel.Purchase = updateDto.Purchase;
            stockModel.LastDiv = updateDto.LastDiv;
            stockModel.Industry = updateDto.Industry;
            stockModel.MarketCap = updateDto.MarketCap;

            _context.SaveChanges();
            return Ok(stockModel.ToStockDtos());
        }

    }
}