import { newMockEvent } from "matchstick-as"
import { ethereum, Address, BigInt } from "@graphprotocol/graph-ts"
import { Deposit, Top3Changed, Withdraw } from "../generated/BigBank/BigBank"

export function createDepositEvent(account: Address, amount: BigInt): Deposit {
  let depositEvent = changetype<Deposit>(newMockEvent())

  depositEvent.parameters = new Array()

  depositEvent.parameters.push(
    new ethereum.EventParam("account", ethereum.Value.fromAddress(account))
  )
  depositEvent.parameters.push(
    new ethereum.EventParam("amount", ethereum.Value.fromUnsignedBigInt(amount))
  )

  return depositEvent
}

export function createTop3ChangedEvent(
  t0: Address,
  t1: Address,
  t2: Address
): Top3Changed {
  let top3ChangedEvent = changetype<Top3Changed>(newMockEvent())

  top3ChangedEvent.parameters = new Array()

  top3ChangedEvent.parameters.push(
    new ethereum.EventParam("t0", ethereum.Value.fromAddress(t0))
  )
  top3ChangedEvent.parameters.push(
    new ethereum.EventParam("t1", ethereum.Value.fromAddress(t1))
  )
  top3ChangedEvent.parameters.push(
    new ethereum.EventParam("t2", ethereum.Value.fromAddress(t2))
  )

  return top3ChangedEvent
}

export function createWithdrawEvent(
  account: Address,
  amount: BigInt,
  remain: BigInt
): Withdraw {
  let withdrawEvent = changetype<Withdraw>(newMockEvent())

  withdrawEvent.parameters = new Array()

  withdrawEvent.parameters.push(
    new ethereum.EventParam("account", ethereum.Value.fromAddress(account))
  )
  withdrawEvent.parameters.push(
    new ethereum.EventParam("amount", ethereum.Value.fromUnsignedBigInt(amount))
  )
  withdrawEvent.parameters.push(
    new ethereum.EventParam("remain", ethereum.Value.fromUnsignedBigInt(remain))
  )

  return withdrawEvent
}
