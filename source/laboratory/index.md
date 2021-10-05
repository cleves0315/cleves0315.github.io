---
title: 实验室
date: 2021-09-04 22:23:18
type: "laboratory"
---

<div class="box-wrapper">
  <div class="box"><div class="back"></div>box1</div>
  <div class="box">box2</div>
  <div class="box">box3</div>
  <div class="box">box4</div>
</div>

<style>
.post-block {
  background: unset;
  box-shadow: unset;
}
.box-wrapper {
  /* display: grid; */
  grid-template-rows: 280px 280px;
  grid-template-columns: 1fr 1fr;
  grid-gap: 20px 20px;
}
.box {
  /* display: inline-block; */
  width: 100%;
  height: 500px;
  margin-bottom: 20px;
  cursor: pointer;
  border-radius: 10px;
  background: #fff;
  box-shadow: 0 2px 8px 0 rgb(0 0 0 / 10%);
}
.box .back {
  height: 400px;
  background: no-repeat;
  background-position: center center;
  background-size: 80%;
  background-image: url(https://6272-broccoli-puuzo-1302613116.tcb.qcloud.la/broccoli.png?sign=b48ffdedc353efb3d43b8c5d4bc8ad46&t=1633422705);
}
</style>
