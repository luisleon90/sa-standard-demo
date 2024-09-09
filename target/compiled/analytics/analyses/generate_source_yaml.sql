version: 2

sources:
  - name: tpch
    database: raw
    schema: tpch_sf001
    tables:
      - name: orders
        columns:
          - name: o_orderkey
          - name: o_custkey
          - name: o_orderstatus
          - name: o_totalprice
          - name: o_orderdate
          - name: o_orderpriority
          - name: o_clerk
          - name: o_shippriority
          - name: o_comment

      - name: customer
        columns:
          - name: c_custkey
          - name: c_name
          - name: c_address
          - name: c_nationkey
          - name: c_phone
          - name: c_acctbal
          - name: c_mktsegment
          - name: c_comment

      - name: lineitem
        columns:
          - name: l_orderkey
          - name: l_partkey
          - name: l_suppkey
          - name: l_linenumber
          - name: l_quantity
          - name: l_extendedprice
          - name: l_discount
          - name: l_tax
          - name: l_returnflag
          - name: l_linestatus
          - name: l_shipdate
          - name: l_commitdate
          - name: l_receiptdate
          - name: l_shipinstruct
          - name: l_shipmode
          - name: l_comment
