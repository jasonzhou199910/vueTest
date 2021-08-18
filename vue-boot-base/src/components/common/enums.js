import { Enum } from './Enum'

export default {
  // 店铺类型枚举
  StoreTypeEnum: new Enum().add('RENTED', '已租', 1).add('REVOKE', '撤销', 2).add('RELEASE','发布中',3),
  OrderStatusEnum:new Enum().add("RELEASE","发布中",1).add("RECEIVED","已接单",2).add("COMPLETED","已完成",3).add("INCOMPLETE","未完成",4),
  // redis值类型枚举
  ValueTypeEnum: new Enum().add('string', 'string', 1).add('set', 'set', 2),
  DbTypeEnum: new Enum().add('MYSQL', 'mysql', 1).add('ORACLE', 'oracle', 2)
}
