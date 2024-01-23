import {
  Deposit as DepositEvent,
  Top3Changed as Top3ChangedEvent,
  Withdraw as WithdrawEvent
} from "../generated/BigBank/BigBank"
import { Deposit, Top3Changed, Withdraw } from "../generated/schema"
import { log } from '@graphprotocol/graph-ts'

export function handleDeposit(event: DepositEvent): void {
  let entity = new Deposit(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.account = event.params.account
  entity.amount = event.params.amount

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
  log.debug("handleDeposit",[])
}

export function handleTop3Changed(event: Top3ChangedEvent): void {
  let entity = new Top3Changed(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.t0 = event.params.t0
  entity.t1 = event.params.t1
  entity.t2 = event.params.t2

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
  log.debug("handleTop3Changed",[])
}

export function handleWithdraw(event: WithdrawEvent): void {
  let entity = new Withdraw(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.account = event.params.account
  entity.amount = event.params.amount
  entity.remain = event.params.remain

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
  log.info("handleWithdraw",[])
}
