# Test Cases for worldborder size adjustments

- 350  
  ↑: 400  (350 with a step of 100 → 350+50=400)  
  ↓: 300  (400 is a boundary; if exactly at a boundary, decrease subtracts full step: 400-100=300)

- 845  
  ↑: 1000  (845 is in the 500–999 range with a 250 step, so ceil(845/250)=4*250=1000)  
  ↓: 750   (floor(845/250)=3*250=750) - 690

- 1375  
  ↑: 1500  (1375 is in the 1000–1999 bracket with a 500 step, so ceil(1375/500)=3*500=1500)  
  ↓: 1000  (floor(1375/500)=2*500=1000) - 1250

- 2375  
  ↑: 3000  (2375 is in the 2000–19999 range with a 1000 step, so ceil(2375/1000)=3*1000=3000)  
  ↓: 2000  (floor(2375/1000)=2*1000=2000) -1750

- 21200  
  ↑: 30000  (21200 is in the 20000–199999 range with a 10000 step, so ceil(21200/10000)=3*10000=30000)  
  ↓: 20000  (floor(21200/10000)=2*10000=20000) - 12400

- 235000  
  ↑: 250000  (235000 is in the 200000–1000000 range with a 50000 step, so ceil(235000/50000)=5*50000=250000)  
  ↓: 200000  (floor(235000/50000)=4*50000=200000) - 220000
