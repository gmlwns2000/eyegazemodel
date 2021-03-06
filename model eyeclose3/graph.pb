node {
  name: "input_image"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 36
        }
        dim {
          size: 36
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "input_label"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 2
        }
      }
    }
  }
}
node {
  name: "keep_prob"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "phase_train"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.27216553688049316
      }
    }
  }
}
node {
  name: "truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal/mul"
  op: "Mul"
  input: "truncated_normal/TruncatedNormal"
  input: "truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal"
  op: "Add"
  input: "truncated_normal/mul"
  input: "truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Assign"
  op: "Assign"
  input: "Variable"
  input: "truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/read"
  op: "Identity"
  input: "Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Assign"
  op: "Assign"
  input: "Variable_1"
  input: "Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/read"
  op: "Identity"
  input: "Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "Conv2D"
  op: "Conv2D"
  input: "input_image"
  input: "Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add"
  op: "Add"
  input: "Conv2D"
  input: "Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/Variable/Assign"
  op: "Assign"
  input: "bn/Variable"
  input: "bn/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/Variable/read"
  op: "Identity"
  input: "bn/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
}
node {
  name: "bn/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/Variable_1/Assign"
  op: "Assign"
  input: "bn/Variable_1"
  input: "bn/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/Variable_1/read"
  op: "Identity"
  input: "bn/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
}
node {
  name: "bn/moments/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn/moments/Mean"
  op: "Mean"
  input: "add"
  input: "bn/moments/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn/moments/StopGradient"
  op: "StopGradient"
  input: "bn/moments/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/moments/Sub"
  op: "Sub"
  input: "add"
  input: "bn/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/moments/shifted_mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn/moments/shifted_mean"
  op: "Mean"
  input: "bn/moments/Sub"
  input: "bn/moments/shifted_mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "add"
  input: "bn/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/moments/Mean_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn/moments/Mean_1"
  op: "Mean"
  input: "bn/moments/SquaredDifference"
  input: "bn/moments/Mean_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn/moments/Square"
  op: "Square"
  input: "bn/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/moments/variance"
  op: "Sub"
  input: "bn/moments/Mean_1"
  input: "bn/moments/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/moments/mean"
  op: "Add"
  input: "bn/moments/shifted_mean"
  input: "bn/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/moments/Squeeze"
  op: "Squeeze"
  input: "bn/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn/moments/Squeeze_1"
  op: "Squeeze"
  input: "bn/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn/cond/switch_t"
  op: "Identity"
  input: "bn/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn/cond/switch_f"
  op: "Identity"
  input: "bn/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn/bn/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn/moments/Squeeze/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn/moments/Squeeze/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn/moments/Squeeze/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn/moments/Squeeze/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/decay"
  op: "Const"
  input: "^bn/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  op: "Const"
  input: "^bn/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  op: "Sub"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  input: "bn/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch"
  op: "Switch"
  input: "bn/bn/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1"
  op: "Switch"
  input: "bn/moments/Squeeze"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/moments/Squeeze"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch:1"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  op: "Mul"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "bn/bn/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg"
  op: "AssignSub"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/Switch:1"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  op: "Const"
  input: "^bn/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  input: "bn/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch"
  op: "Switch"
  input: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1"
  op: "Switch"
  input: "bn/moments/Squeeze_1"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/moments/Squeeze_1"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch:1"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch"
  op: "RefSwitch"
  input: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch:1"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn/cond/ExponentialMovingAverage"
  op: "NoOp"
  input: "^bn/cond/ExponentialMovingAverage/AssignMovingAvg"
  input: "^bn/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  input: "^bn/cond/switch_t"
}
node {
  name: "bn/cond/Identity"
  op: "Identity"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  input: "^bn/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/cond/Identity_1"
  op: "Identity"
  input: "bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  input: "^bn/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/cond/Switch_1"
  op: "Switch"
  input: "bn/bn/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/Switch_2"
  op: "Switch"
  input: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/cond/Merge"
  op: "Merge"
  input: "bn/cond/Switch_1"
  input: "bn/cond/Identity"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/cond/Merge_1"
  op: "Merge"
  input: "bn/cond/Switch_2"
  input: "bn/cond/Identity_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "bn/batchnorm/add"
  op: "Add"
  input: "bn/cond/Merge_1"
  input: "bn/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "bn/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/batchnorm/mul"
  op: "Mul"
  input: "bn/batchnorm/Rsqrt"
  input: "bn/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/batchnorm/mul_1"
  op: "Mul"
  input: "add"
  input: "bn/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/batchnorm/mul_2"
  op: "Mul"
  input: "bn/cond/Merge"
  input: "bn/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/batchnorm/sub"
  op: "Sub"
  input: "bn/Variable/read"
  input: "bn/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn/batchnorm/add_1"
  op: "Add"
  input: "bn/batchnorm/mul_1"
  input: "bn/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Relu"
  op: "Relu"
  input: "bn/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool"
  op: "MaxPool"
  input: "Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "truncated_normal_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\010\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_1/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_1/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1666666716337204
      }
    }
  }
}
node {
  name: "truncated_normal_1/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_1/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_1/mul"
  op: "Mul"
  input: "truncated_normal_1/TruncatedNormal"
  input: "truncated_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_1"
  op: "Add"
  input: "truncated_normal_1/mul"
  input: "truncated_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_2"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_2/Assign"
  op: "Assign"
  input: "Variable_2"
  input: "truncated_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_2/read"
  op: "Identity"
  input: "Variable_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
}
node {
  name: "Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_3"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_3/Assign"
  op: "Assign"
  input: "Variable_3"
  input: "Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_3/read"
  op: "Identity"
  input: "Variable_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
}
node {
  name: "Conv2D_1"
  op: "Conv2D"
  input: "MaxPool"
  input: "Variable_2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_1"
  op: "Add"
  input: "Conv2D_1"
  input: "Variable_3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_1/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_1/Variable/Assign"
  op: "Assign"
  input: "bn_1/Variable"
  input: "bn_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_1/Variable/read"
  op: "Identity"
  input: "bn_1/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
}
node {
  name: "bn_1/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_1/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_1/Variable_1/Assign"
  op: "Assign"
  input: "bn_1/Variable_1"
  input: "bn_1/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_1/Variable_1/read"
  op: "Identity"
  input: "bn_1/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
}
node {
  name: "bn_1/moments/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_1/moments/Mean"
  op: "Mean"
  input: "add_1"
  input: "bn_1/moments/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_1/moments/StopGradient"
  op: "StopGradient"
  input: "bn_1/moments/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/moments/Sub"
  op: "Sub"
  input: "add_1"
  input: "bn_1/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/moments/shifted_mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_1/moments/shifted_mean"
  op: "Mean"
  input: "bn_1/moments/Sub"
  input: "bn_1/moments/shifted_mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_1/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "add_1"
  input: "bn_1/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/moments/Mean_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_1/moments/Mean_1"
  op: "Mean"
  input: "bn_1/moments/SquaredDifference"
  input: "bn_1/moments/Mean_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_1/moments/Square"
  op: "Square"
  input: "bn_1/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/moments/variance"
  op: "Sub"
  input: "bn_1/moments/Mean_1"
  input: "bn_1/moments/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/moments/mean"
  op: "Add"
  input: "bn_1/moments/shifted_mean"
  input: "bn_1/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/moments/Squeeze"
  op: "Squeeze"
  input: "bn_1/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_1/moments/Squeeze_1"
  op: "Squeeze"
  input: "bn_1/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_1/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_1/cond/switch_t"
  op: "Identity"
  input: "bn_1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_1/cond/switch_f"
  op: "Identity"
  input: "bn_1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_1/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/decay"
  op: "Const"
  input: "^bn_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  op: "Const"
  input: "^bn_1/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  op: "Sub"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  input: "bn_1/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1"
  op: "Switch"
  input: "bn_1/moments/Squeeze"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/moments/Squeeze"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch:1"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  op: "Mul"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg"
  op: "AssignSub"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/Switch:1"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  op: "Const"
  input: "^bn_1/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  input: "bn_1/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1"
  op: "Switch"
  input: "bn_1/moments/Squeeze_1"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/moments/Squeeze_1"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch:1"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch"
  op: "RefSwitch"
  input: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch:1"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_1/cond/ExponentialMovingAverage"
  op: "NoOp"
  input: "^bn_1/cond/ExponentialMovingAverage/AssignMovingAvg"
  input: "^bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  input: "^bn_1/cond/switch_t"
}
node {
  name: "bn_1/cond/Identity"
  op: "Identity"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  input: "^bn_1/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/cond/Identity_1"
  op: "Identity"
  input: "bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  input: "^bn_1/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/cond/Switch_1"
  op: "Switch"
  input: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/Switch_2"
  op: "Switch"
  input: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_1/cond/Merge"
  op: "Merge"
  input: "bn_1/cond/Switch_1"
  input: "bn_1/cond/Identity"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/cond/Merge_1"
  op: "Merge"
  input: "bn_1/cond/Switch_2"
  input: "bn_1/cond/Identity_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "bn_1/batchnorm/add"
  op: "Add"
  input: "bn_1/cond/Merge_1"
  input: "bn_1/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "bn_1/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/batchnorm/mul"
  op: "Mul"
  input: "bn_1/batchnorm/Rsqrt"
  input: "bn_1/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/batchnorm/mul_1"
  op: "Mul"
  input: "add_1"
  input: "bn_1/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/batchnorm/mul_2"
  op: "Mul"
  input: "bn_1/cond/Merge"
  input: "bn_1/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/batchnorm/sub"
  op: "Sub"
  input: "bn_1/Variable/read"
  input: "bn_1/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_1/batchnorm/add_1"
  op: "Add"
  input: "bn_1/batchnorm/mul_1"
  input: "bn_1/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Relu_1"
  op: "Relu"
  input: "bn_1/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_1"
  op: "MaxPool"
  input: "Relu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "truncated_normal_2/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_2/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_2/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14907120168209076
      }
    }
  }
}
node {
  name: "truncated_normal_2/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_2/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_2/mul"
  op: "Mul"
  input: "truncated_normal_2/TruncatedNormal"
  input: "truncated_normal_2/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_2"
  op: "Add"
  input: "truncated_normal_2/mul"
  input: "truncated_normal_2/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_4"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_4/Assign"
  op: "Assign"
  input: "Variable_4"
  input: "truncated_normal_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_4/read"
  op: "Identity"
  input: "Variable_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
}
node {
  name: "Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_5"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_5/Assign"
  op: "Assign"
  input: "Variable_5"
  input: "Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_5/read"
  op: "Identity"
  input: "Variable_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
}
node {
  name: "Conv2D_2"
  op: "Conv2D"
  input: "MaxPool_1"
  input: "Variable_4/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_2"
  op: "Add"
  input: "Conv2D_2"
  input: "Variable_5/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_2/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_2/Variable/Assign"
  op: "Assign"
  input: "bn_2/Variable"
  input: "bn_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_2/Variable/read"
  op: "Identity"
  input: "bn_2/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
}
node {
  name: "bn_2/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_2/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_2/Variable_1/Assign"
  op: "Assign"
  input: "bn_2/Variable_1"
  input: "bn_2/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_2/Variable_1/read"
  op: "Identity"
  input: "bn_2/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
}
node {
  name: "bn_2/moments/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_2/moments/Mean"
  op: "Mean"
  input: "add_2"
  input: "bn_2/moments/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_2/moments/StopGradient"
  op: "StopGradient"
  input: "bn_2/moments/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/moments/Sub"
  op: "Sub"
  input: "add_2"
  input: "bn_2/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/moments/shifted_mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_2/moments/shifted_mean"
  op: "Mean"
  input: "bn_2/moments/Sub"
  input: "bn_2/moments/shifted_mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_2/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "add_2"
  input: "bn_2/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/moments/Mean_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_2/moments/Mean_1"
  op: "Mean"
  input: "bn_2/moments/SquaredDifference"
  input: "bn_2/moments/Mean_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_2/moments/Square"
  op: "Square"
  input: "bn_2/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/moments/variance"
  op: "Sub"
  input: "bn_2/moments/Mean_1"
  input: "bn_2/moments/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/moments/mean"
  op: "Add"
  input: "bn_2/moments/shifted_mean"
  input: "bn_2/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/moments/Squeeze"
  op: "Squeeze"
  input: "bn_2/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_2/moments/Squeeze_1"
  op: "Squeeze"
  input: "bn_2/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_2/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_2/cond/switch_t"
  op: "Identity"
  input: "bn_2/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_2/cond/switch_f"
  op: "Identity"
  input: "bn_2/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_2/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/decay"
  op: "Const"
  input: "^bn_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  op: "Const"
  input: "^bn_2/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  op: "Sub"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  input: "bn_2/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1"
  op: "Switch"
  input: "bn_2/moments/Squeeze"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/moments/Squeeze"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch:1"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  op: "Mul"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg"
  op: "AssignSub"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/Switch:1"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  op: "Const"
  input: "^bn_2/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  input: "bn_2/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1"
  op: "Switch"
  input: "bn_2/moments/Squeeze_1"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/moments/Squeeze_1"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch:1"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch"
  op: "RefSwitch"
  input: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch:1"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_2/cond/ExponentialMovingAverage"
  op: "NoOp"
  input: "^bn_2/cond/ExponentialMovingAverage/AssignMovingAvg"
  input: "^bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  input: "^bn_2/cond/switch_t"
}
node {
  name: "bn_2/cond/Identity"
  op: "Identity"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  input: "^bn_2/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/cond/Identity_1"
  op: "Identity"
  input: "bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  input: "^bn_2/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/cond/Switch_1"
  op: "Switch"
  input: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/Switch_2"
  op: "Switch"
  input: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_2/cond/Merge"
  op: "Merge"
  input: "bn_2/cond/Switch_1"
  input: "bn_2/cond/Identity"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/cond/Merge_1"
  op: "Merge"
  input: "bn_2/cond/Switch_2"
  input: "bn_2/cond/Identity_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "bn_2/batchnorm/add"
  op: "Add"
  input: "bn_2/cond/Merge_1"
  input: "bn_2/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "bn_2/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/batchnorm/mul"
  op: "Mul"
  input: "bn_2/batchnorm/Rsqrt"
  input: "bn_2/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/batchnorm/mul_1"
  op: "Mul"
  input: "add_2"
  input: "bn_2/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/batchnorm/mul_2"
  op: "Mul"
  input: "bn_2/cond/Merge"
  input: "bn_2/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/batchnorm/sub"
  op: "Sub"
  input: "bn_2/Variable/read"
  input: "bn_2/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_2/batchnorm/add_1"
  op: "Add"
  input: "bn_2/batchnorm/mul_1"
  input: "bn_2/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Relu_2"
  op: "Relu"
  input: "bn_2/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_3/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_3/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_3/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14907120168209076
      }
    }
  }
}
node {
  name: "truncated_normal_3/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_3/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_3/mul"
  op: "Mul"
  input: "truncated_normal_3/TruncatedNormal"
  input: "truncated_normal_3/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_3"
  op: "Add"
  input: "truncated_normal_3/mul"
  input: "truncated_normal_3/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_6"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_6/Assign"
  op: "Assign"
  input: "Variable_6"
  input: "truncated_normal_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_6/read"
  op: "Identity"
  input: "Variable_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
}
node {
  name: "Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_7"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_7/Assign"
  op: "Assign"
  input: "Variable_7"
  input: "Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_7/read"
  op: "Identity"
  input: "Variable_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
}
node {
  name: "Conv2D_3"
  op: "Conv2D"
  input: "Relu_2"
  input: "Variable_6/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_3"
  op: "Add"
  input: "Conv2D_3"
  input: "Variable_7/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_3/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_3/Variable/Assign"
  op: "Assign"
  input: "bn_3/Variable"
  input: "bn_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_3/Variable/read"
  op: "Identity"
  input: "bn_3/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
}
node {
  name: "bn_3/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_3/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_3/Variable_1/Assign"
  op: "Assign"
  input: "bn_3/Variable_1"
  input: "bn_3/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_3/Variable_1/read"
  op: "Identity"
  input: "bn_3/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
}
node {
  name: "bn_3/moments/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_3/moments/Mean"
  op: "Mean"
  input: "add_3"
  input: "bn_3/moments/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_3/moments/StopGradient"
  op: "StopGradient"
  input: "bn_3/moments/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/moments/Sub"
  op: "Sub"
  input: "add_3"
  input: "bn_3/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/moments/shifted_mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_3/moments/shifted_mean"
  op: "Mean"
  input: "bn_3/moments/Sub"
  input: "bn_3/moments/shifted_mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_3/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "add_3"
  input: "bn_3/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/moments/Mean_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_3/moments/Mean_1"
  op: "Mean"
  input: "bn_3/moments/SquaredDifference"
  input: "bn_3/moments/Mean_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_3/moments/Square"
  op: "Square"
  input: "bn_3/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/moments/variance"
  op: "Sub"
  input: "bn_3/moments/Mean_1"
  input: "bn_3/moments/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/moments/mean"
  op: "Add"
  input: "bn_3/moments/shifted_mean"
  input: "bn_3/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/moments/Squeeze"
  op: "Squeeze"
  input: "bn_3/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_3/moments/Squeeze_1"
  op: "Squeeze"
  input: "bn_3/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_3/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_3/cond/switch_t"
  op: "Identity"
  input: "bn_3/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_3/cond/switch_f"
  op: "Identity"
  input: "bn_3/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_3/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/decay"
  op: "Const"
  input: "^bn_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  op: "Const"
  input: "^bn_3/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  op: "Sub"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  input: "bn_3/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1"
  op: "Switch"
  input: "bn_3/moments/Squeeze"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/moments/Squeeze"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch:1"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  op: "Mul"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg"
  op: "AssignSub"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/Switch:1"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  op: "Const"
  input: "^bn_3/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  input: "bn_3/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1"
  op: "Switch"
  input: "bn_3/moments/Squeeze_1"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/moments/Squeeze_1"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch:1"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch"
  op: "RefSwitch"
  input: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch:1"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_3/cond/ExponentialMovingAverage"
  op: "NoOp"
  input: "^bn_3/cond/ExponentialMovingAverage/AssignMovingAvg"
  input: "^bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  input: "^bn_3/cond/switch_t"
}
node {
  name: "bn_3/cond/Identity"
  op: "Identity"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  input: "^bn_3/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/cond/Identity_1"
  op: "Identity"
  input: "bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  input: "^bn_3/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/cond/Switch_1"
  op: "Switch"
  input: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/Switch_2"
  op: "Switch"
  input: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_3/cond/Merge"
  op: "Merge"
  input: "bn_3/cond/Switch_1"
  input: "bn_3/cond/Identity"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/cond/Merge_1"
  op: "Merge"
  input: "bn_3/cond/Switch_2"
  input: "bn_3/cond/Identity_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "bn_3/batchnorm/add"
  op: "Add"
  input: "bn_3/cond/Merge_1"
  input: "bn_3/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "bn_3/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/batchnorm/mul"
  op: "Mul"
  input: "bn_3/batchnorm/Rsqrt"
  input: "bn_3/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/batchnorm/mul_1"
  op: "Mul"
  input: "add_3"
  input: "bn_3/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/batchnorm/mul_2"
  op: "Mul"
  input: "bn_3/cond/Merge"
  input: "bn_3/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/batchnorm/sub"
  op: "Sub"
  input: "bn_3/Variable/read"
  input: "bn_3/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_3/batchnorm/add_1"
  op: "Add"
  input: "bn_3/batchnorm/mul_1"
  input: "bn_3/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Relu_3"
  op: "Relu"
  input: "bn_3/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_4/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\024\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_4/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_4/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10540925711393356
      }
    }
  }
}
node {
  name: "truncated_normal_4/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_4/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_4/mul"
  op: "Mul"
  input: "truncated_normal_4/TruncatedNormal"
  input: "truncated_normal_4/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_4"
  op: "Add"
  input: "truncated_normal_4/mul"
  input: "truncated_normal_4/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_8"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_8/Assign"
  op: "Assign"
  input: "Variable_8"
  input: "truncated_normal_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_8/read"
  op: "Identity"
  input: "Variable_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
}
node {
  name: "Const_4"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_9"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_9/Assign"
  op: "Assign"
  input: "Variable_9"
  input: "Const_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_9/read"
  op: "Identity"
  input: "Variable_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
}
node {
  name: "Conv2D_4"
  op: "Conv2D"
  input: "Relu_3"
  input: "Variable_8/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_4"
  op: "Add"
  input: "Conv2D_4"
  input: "Variable_9/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_4/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_4/Variable/Assign"
  op: "Assign"
  input: "bn_4/Variable"
  input: "bn_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_4/Variable/read"
  op: "Identity"
  input: "bn_4/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
}
node {
  name: "bn_4/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_4/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_4/Variable_1/Assign"
  op: "Assign"
  input: "bn_4/Variable_1"
  input: "bn_4/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_4/Variable_1/read"
  op: "Identity"
  input: "bn_4/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
}
node {
  name: "bn_4/moments/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_4/moments/Mean"
  op: "Mean"
  input: "add_4"
  input: "bn_4/moments/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_4/moments/StopGradient"
  op: "StopGradient"
  input: "bn_4/moments/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/moments/Sub"
  op: "Sub"
  input: "add_4"
  input: "bn_4/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/moments/shifted_mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_4/moments/shifted_mean"
  op: "Mean"
  input: "bn_4/moments/Sub"
  input: "bn_4/moments/shifted_mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_4/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "add_4"
  input: "bn_4/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/moments/Mean_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_4/moments/Mean_1"
  op: "Mean"
  input: "bn_4/moments/SquaredDifference"
  input: "bn_4/moments/Mean_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_4/moments/Square"
  op: "Square"
  input: "bn_4/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/moments/variance"
  op: "Sub"
  input: "bn_4/moments/Mean_1"
  input: "bn_4/moments/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/moments/mean"
  op: "Add"
  input: "bn_4/moments/shifted_mean"
  input: "bn_4/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/moments/Squeeze"
  op: "Squeeze"
  input: "bn_4/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_4/moments/Squeeze_1"
  op: "Squeeze"
  input: "bn_4/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_4/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_4/cond/switch_t"
  op: "Identity"
  input: "bn_4/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_4/cond/switch_f"
  op: "Identity"
  input: "bn_4/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_4/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/decay"
  op: "Const"
  input: "^bn_4/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  op: "Const"
  input: "^bn_4/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  op: "Sub"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  input: "bn_4/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1"
  op: "Switch"
  input: "bn_4/moments/Squeeze"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/moments/Squeeze"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch:1"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  op: "Mul"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg"
  op: "AssignSub"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/Switch:1"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  op: "Const"
  input: "^bn_4/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  input: "bn_4/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1"
  op: "Switch"
  input: "bn_4/moments/Squeeze_1"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/moments/Squeeze_1"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch:1"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch"
  op: "RefSwitch"
  input: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch:1"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_4/cond/ExponentialMovingAverage"
  op: "NoOp"
  input: "^bn_4/cond/ExponentialMovingAverage/AssignMovingAvg"
  input: "^bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  input: "^bn_4/cond/switch_t"
}
node {
  name: "bn_4/cond/Identity"
  op: "Identity"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  input: "^bn_4/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/cond/Identity_1"
  op: "Identity"
  input: "bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  input: "^bn_4/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/cond/Switch_1"
  op: "Switch"
  input: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/Switch_2"
  op: "Switch"
  input: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_4/cond/Merge"
  op: "Merge"
  input: "bn_4/cond/Switch_1"
  input: "bn_4/cond/Identity"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/cond/Merge_1"
  op: "Merge"
  input: "bn_4/cond/Switch_2"
  input: "bn_4/cond/Identity_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "bn_4/batchnorm/add"
  op: "Add"
  input: "bn_4/cond/Merge_1"
  input: "bn_4/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "bn_4/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/batchnorm/mul"
  op: "Mul"
  input: "bn_4/batchnorm/Rsqrt"
  input: "bn_4/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/batchnorm/mul_1"
  op: "Mul"
  input: "add_4"
  input: "bn_4/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/batchnorm/mul_2"
  op: "Mul"
  input: "bn_4/cond/Merge"
  input: "bn_4/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/batchnorm/sub"
  op: "Sub"
  input: "bn_4/Variable/read"
  input: "bn_4/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_4/batchnorm/add_1"
  op: "Add"
  input: "bn_4/batchnorm/mul_1"
  input: "bn_4/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Relu_4"
  op: "Relu"
  input: "bn_4/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_5/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\024\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_5/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_5/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10540925711393356
      }
    }
  }
}
node {
  name: "truncated_normal_5/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_5/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_5/mul"
  op: "Mul"
  input: "truncated_normal_5/TruncatedNormal"
  input: "truncated_normal_5/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_5"
  op: "Add"
  input: "truncated_normal_5/mul"
  input: "truncated_normal_5/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_10"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_10/Assign"
  op: "Assign"
  input: "Variable_10"
  input: "truncated_normal_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_10/read"
  op: "Identity"
  input: "Variable_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
}
node {
  name: "Const_5"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_11"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_11/Assign"
  op: "Assign"
  input: "Variable_11"
  input: "Const_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_11/read"
  op: "Identity"
  input: "Variable_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
}
node {
  name: "Conv2D_5"
  op: "Conv2D"
  input: "Relu_4"
  input: "Variable_10/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_5"
  op: "Add"
  input: "Conv2D_5"
  input: "Variable_11/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_5/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_5/Variable/Assign"
  op: "Assign"
  input: "bn_5/Variable"
  input: "bn_5/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_5/Variable/read"
  op: "Identity"
  input: "bn_5/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
}
node {
  name: "bn_5/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_5/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_5/Variable_1/Assign"
  op: "Assign"
  input: "bn_5/Variable_1"
  input: "bn_5/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_5/Variable_1/read"
  op: "Identity"
  input: "bn_5/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
}
node {
  name: "bn_5/moments/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_5/moments/Mean"
  op: "Mean"
  input: "add_5"
  input: "bn_5/moments/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_5/moments/StopGradient"
  op: "StopGradient"
  input: "bn_5/moments/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/moments/Sub"
  op: "Sub"
  input: "add_5"
  input: "bn_5/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/moments/shifted_mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_5/moments/shifted_mean"
  op: "Mean"
  input: "bn_5/moments/Sub"
  input: "bn_5/moments/shifted_mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_5/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "add_5"
  input: "bn_5/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/moments/Mean_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "bn_5/moments/Mean_1"
  op: "Mean"
  input: "bn_5/moments/SquaredDifference"
  input: "bn_5/moments/Mean_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "bn_5/moments/Square"
  op: "Square"
  input: "bn_5/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/moments/variance"
  op: "Sub"
  input: "bn_5/moments/Mean_1"
  input: "bn_5/moments/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/moments/mean"
  op: "Add"
  input: "bn_5/moments/shifted_mean"
  input: "bn_5/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/moments/Squeeze"
  op: "Squeeze"
  input: "bn_5/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_5/moments/Squeeze_1"
  op: "Squeeze"
  input: "bn_5/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
        i: 1
        i: 2
      }
    }
  }
}
node {
  name: "bn_5/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_5/cond/switch_t"
  op: "Identity"
  input: "bn_5/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_5/cond/switch_f"
  op: "Identity"
  input: "bn_5/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn_5/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  op: "Assign"
  input: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage/read"
  op: "Identity"
  input: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/decay"
  op: "Const"
  input: "^bn_5/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  op: "Const"
  input: "^bn_5/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  op: "Sub"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub/x"
  input: "bn_5/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1"
  op: "Switch"
  input: "bn_5/moments/Squeeze"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/moments/Squeeze"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch:1"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  op: "Mul"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg"
  op: "AssignSub"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/Switch:1"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  op: "Const"
  input: "^bn_5/cond/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub/x"
  input: "bn_5/cond/ExponentialMovingAverage/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch"
  op: "Switch"
  input: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1"
  op: "Switch"
  input: "bn_5/moments/Squeeze_1"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/moments/Squeeze_1"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch:1"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch"
  op: "RefSwitch"
  input: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  op: "AssignSub"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/Switch:1"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "bn_5/cond/ExponentialMovingAverage"
  op: "NoOp"
  input: "^bn_5/cond/ExponentialMovingAverage/AssignMovingAvg"
  input: "^bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1"
  input: "^bn_5/cond/switch_t"
}
node {
  name: "bn_5/cond/Identity"
  op: "Identity"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1:1"
  input: "^bn_5/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/cond/Identity_1"
  op: "Identity"
  input: "bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1:1"
  input: "^bn_5/cond/ExponentialMovingAverage"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/cond/Switch_1"
  op: "Switch"
  input: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage/read"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/Switch_2"
  op: "Switch"
  input: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage/read"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "bn_5/cond/Merge"
  op: "Merge"
  input: "bn_5/cond/Switch_1"
  input: "bn_5/cond/Identity"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/cond/Merge_1"
  op: "Merge"
  input: "bn_5/cond/Switch_2"
  input: "bn_5/cond/Identity_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "bn_5/batchnorm/add"
  op: "Add"
  input: "bn_5/cond/Merge_1"
  input: "bn_5/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "bn_5/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/batchnorm/mul"
  op: "Mul"
  input: "bn_5/batchnorm/Rsqrt"
  input: "bn_5/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/batchnorm/mul_1"
  op: "Mul"
  input: "add_5"
  input: "bn_5/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/batchnorm/mul_2"
  op: "Mul"
  input: "bn_5/cond/Merge"
  input: "bn_5/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/batchnorm/sub"
  op: "Sub"
  input: "bn_5/Variable/read"
  input: "bn_5/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "bn_5/batchnorm/add_1"
  op: "Add"
  input: "bn_5/batchnorm/mul_1"
  input: "bn_5/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Relu_5"
  op: "Relu"
  input: "bn_5/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_2"
  op: "MaxPool"
  input: "Relu_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "AvgPool"
  op: "AvgPool"
  input: "MaxPool_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 5
        i: 5
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 5
        i: 5
        i: 1
      }
    }
  }
}
node {
  name: "Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\024\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape"
  op: "Reshape"
  input: "AvgPool"
  input: "Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "truncated_normal_6/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\024\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_6/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_6/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3162277638912201
      }
    }
  }
}
node {
  name: "truncated_normal_6/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_6/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_6/mul"
  op: "Mul"
  input: "truncated_normal_6/TruncatedNormal"
  input: "truncated_normal_6/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_6"
  op: "Add"
  input: "truncated_normal_6/mul"
  input: "truncated_normal_6/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_12"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_12/Assign"
  op: "Assign"
  input: "Variable_12"
  input: "truncated_normal_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_12/read"
  op: "Identity"
  input: "Variable_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
}
node {
  name: "L2Loss"
  op: "L2Loss"
  input: "Variable_12/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Mul"
  op: "Mul"
  input: "L2Loss"
  input: "Mul/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const_6"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "Sum"
  op: "Sum"
  input: "Mul"
  input: "Const_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Const_7"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_13"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_13/Assign"
  op: "Assign"
  input: "Variable_13"
  input: "Const_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_13/read"
  op: "Identity"
  input: "Variable_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
}
node {
  name: "MatMul"
  op: "MatMul"
  input: "Reshape"
  input: "Variable_12/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "Add"
  op: "Add"
  input: "MatMul"
  input: "Variable_13/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "output"
  op: "Softmax"
  input: "Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Log"
  op: "Log"
  input: "output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul"
  op: "Mul"
  input: "input_label"
  input: "Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Sum_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Sum_1"
  op: "Sum"
  input: "mul"
  input: "Sum_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Neg"
  op: "Neg"
  input: "Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const_8"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Mean"
  op: "Mean"
  input: "Neg"
  input: "Const_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax"
  op: "ArgMax"
  input: "output"
  input: "ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ArgMax_1/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_1"
  op: "ArgMax"
  input: "input_label"
  input: "ArgMax_1/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Equal"
  op: "Equal"
  input: "ArgMax"
  input: "ArgMax_1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Cast"
  op: "Cast"
  input: "Equal"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "Const_9"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Mean_1"
  op: "Mean"
  input: "Cast"
  input: "Const_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Variable_14/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Variable_14"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_14/Assign"
  op: "Assign"
  input: "Variable_14"
  input: "Variable_14/initial_value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_14/read"
  op: "Identity"
  input: "Variable_14"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
}
node {
  name: "ExponentialDecay/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-05
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast"
  op: "Cast"
  input: "Variable_14/read"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ExponentialDecay/Cast_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 163
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast_1"
  op: "Cast"
  input: "ExponentialDecay/Cast_1/x"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ExponentialDecay/Cast_2/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.800000011920929
      }
    }
  }
}
node {
  name: "ExponentialDecay/truediv"
  op: "RealDiv"
  input: "ExponentialDecay/Cast"
  input: "ExponentialDecay/Cast_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay/Floor"
  op: "Floor"
  input: "ExponentialDecay/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay/Pow"
  op: "Pow"
  input: "ExponentialDecay/Cast_2/x"
  input: "ExponentialDecay/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay"
  op: "Mul"
  input: "ExponentialDecay/learning_rate"
  input: "ExponentialDecay/Pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mean_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/Fill"
  input: "gradients/Mean_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape"
  op: "Shape"
  input: "Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Tile"
  op: "Tile"
  input: "gradients/Mean_grad/Reshape"
  input: "gradients/Mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_1"
  op: "Shape"
  input: "Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Prod"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_1"
  input: "gradients/Mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_2"
  input: "gradients/Mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/Mean_grad/Prod_1"
  input: "gradients/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/Mean_grad/Prod"
  input: "gradients/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Cast"
  op: "Cast"
  input: "gradients/Mean_grad/floordiv"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/Mean_grad/Tile"
  input: "gradients/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Neg_grad/Neg"
  op: "Neg"
  input: "gradients/Mean_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Shape"
  op: "Shape"
  input: "mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/add"
  op: "Add"
  input: "Sum_1/reduction_indices"
  input: "gradients/Sum_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/mod"
  op: "FloorMod"
  input: "gradients/Sum_1_grad/add"
  input: "gradients/Sum_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/range"
  op: "Range"
  input: "gradients/Sum_1_grad/range/start"
  input: "gradients/Sum_1_grad/Size"
  input: "gradients/Sum_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Fill"
  op: "Fill"
  input: "gradients/Sum_1_grad/Shape_1"
  input: "gradients/Sum_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/Sum_1_grad/range"
  input: "gradients/Sum_1_grad/mod"
  input: "gradients/Sum_1_grad/Shape"
  input: "gradients/Sum_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Maximum"
  op: "Maximum"
  input: "gradients/Sum_1_grad/DynamicStitch"
  input: "gradients/Sum_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/Sum_1_grad/Shape"
  input: "gradients/Sum_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/Neg_grad/Neg"
  input: "gradients/Sum_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Tile"
  op: "Tile"
  input: "gradients/Sum_1_grad/Reshape"
  input: "gradients/Sum_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/Shape"
  op: "Shape"
  input: "input_label"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/Shape_1"
  op: "Shape"
  input: "Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_grad/Shape"
  input: "gradients/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/mul"
  op: "Mul"
  input: "gradients/Sum_1_grad/Tile"
  input: "Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Sum"
  op: "Sum"
  input: "gradients/mul_grad/mul"
  input: "gradients/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_grad/Sum"
  input: "gradients/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/mul_1"
  op: "Mul"
  input: "input_label"
  input: "gradients/Sum_1_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_grad/mul_1"
  input: "gradients/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_grad/Sum_1"
  input: "gradients/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_grad/Reshape"
  input: "^gradients/mul_grad/Reshape_1"
}
node {
  name: "gradients/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_grad/Reshape"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_grad/Reshape_1"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Log_grad/Reciprocal"
  op: "Reciprocal"
  input: "output"
  input: "^gradients/mul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Log_grad/mul"
  op: "Mul"
  input: "gradients/mul_grad/tuple/control_dependency_1"
  input: "gradients/Log_grad/Reciprocal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/output_grad/mul"
  op: "Mul"
  input: "gradients/Log_grad/mul"
  input: "output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/output_grad/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/output_grad/Sum"
  op: "Sum"
  input: "gradients/output_grad/mul"
  input: "gradients/output_grad/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/output_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/output_grad/Reshape"
  op: "Reshape"
  input: "gradients/output_grad/Sum"
  input: "gradients/output_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/output_grad/sub"
  op: "Sub"
  input: "gradients/Log_grad/mul"
  input: "gradients/output_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/output_grad/mul_1"
  op: "Mul"
  input: "gradients/output_grad/sub"
  input: "output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Add_grad/Shape"
  op: "Shape"
  input: "MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/Add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Add_grad/Shape"
  input: "gradients/Add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_grad/Sum"
  op: "Sum"
  input: "gradients/output_grad/mul_1"
  input: "gradients/Add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Add_grad/Reshape"
  op: "Reshape"
  input: "gradients/Add_grad/Sum"
  input: "gradients/Add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_grad/Sum_1"
  op: "Sum"
  input: "gradients/output_grad/mul_1"
  input: "gradients/Add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Add_grad/Sum_1"
  input: "gradients/Add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Add_grad/Reshape"
  input: "^gradients/Add_grad/Reshape_1"
}
node {
  name: "gradients/Add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Add_grad/Reshape"
  input: "^gradients/Add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Add_grad/Reshape_1"
  input: "^gradients/Add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/Add_grad/tuple/control_dependency"
  input: "Variable_12/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "Reshape"
  input: "gradients/Add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_grad/MatMul"
  input: "^gradients/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_grad/MatMul"
  input: "^gradients/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_grad/MatMul_1"
  input: "^gradients/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/Reshape_grad/Shape"
  op: "Shape"
  input: "AvgPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/MatMul_grad/tuple/control_dependency"
  input: "gradients/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AvgPool_grad/Shape"
  op: "Shape"
  input: "MaxPool_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AvgPool_grad/AvgPoolGrad"
  op: "AvgPoolGrad"
  input: "gradients/AvgPool_grad/Shape"
  input: "gradients/Reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 5
        i: 5
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 5
        i: 5
        i: 1
      }
    }
  }
}
node {
  name: "gradients/MaxPool_2_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "Relu_5"
  input: "MaxPool_2"
  input: "gradients/AvgPool_grad/AvgPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/Relu_5_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/MaxPool_2_grad/MaxPoolGrad"
  input: "Relu_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "bn_5/batchnorm/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/batchnorm/add_1_grad/Shape"
  input: "gradients/bn_5/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/Relu_5_grad/ReluGrad"
  input: "gradients/bn_5/batchnorm/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/add_1_grad/Sum"
  input: "gradients/bn_5/batchnorm/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/Relu_5_grad/ReluGrad"
  input: "gradients/bn_5/batchnorm/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/add_1_grad/Sum_1"
  input: "gradients/bn_5/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/bn_5/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/batchnorm/mul_1_grad/Shape"
  input: "gradients/bn_5/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/bn_5/batchnorm/add_1_grad/tuple/control_dependency"
  input: "bn_5/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/mul_1_grad/mul"
  input: "gradients/bn_5/batchnorm/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/mul_1_grad/Sum"
  input: "gradients/bn_5/batchnorm/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/mul_1"
  op: "Mul"
  input: "add_5"
  input: "gradients/bn_5/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/mul_1_grad/mul_1"
  input: "gradients/bn_5/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/bn_5/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/bn_5/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/batchnorm/sub_grad/Shape"
  input: "gradients/bn_5/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_5/batchnorm/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/sub_grad/Sum"
  input: "gradients/bn_5/batchnorm/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_5/batchnorm/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_5/batchnorm/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/sub_grad/Neg"
  input: "gradients/bn_5/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/sub_grad/Reshape_1"
  input: "^gradients/bn_5/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/batchnorm/mul_2_grad/Shape"
  input: "gradients/bn_5/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/mul"
  op: "Mul"
  input: "gradients/bn_5/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "bn_5/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/mul_2_grad/mul"
  input: "gradients/bn_5/batchnorm/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/mul_2_grad/Sum"
  input: "gradients/bn_5/batchnorm/mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/mul_1"
  op: "Mul"
  input: "bn_5/cond/Merge"
  input: "gradients/bn_5/batchnorm/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/mul_2_grad/mul_1"
  input: "gradients/bn_5/batchnorm/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/mul_2_grad/Sum_1"
  input: "gradients/bn_5/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/mul_2_grad/Reshape_1"
  input: "^gradients/bn_5/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_5/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_5/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/bn_5/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/cond/Merge_grad/cond_grad"
  input: "^gradients/bn_5/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/cond/Merge_grad/cond_grad:1"
  input: "^gradients/bn_5/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AddN"
  op: "AddN"
  input: "gradients/bn_5/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_5/batchnorm/mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/batchnorm/mul_grad/Shape"
  input: "gradients/bn_5/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/mul"
  op: "Mul"
  input: "gradients/AddN"
  input: "bn_5/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/Sum"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/mul_grad/mul"
  input: "gradients/bn_5/batchnorm/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/mul_grad/Sum"
  input: "gradients/bn_5/batchnorm/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/mul_1"
  op: "Mul"
  input: "bn_5/batchnorm/Rsqrt"
  input: "gradients/AddN"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/mul_grad/mul_1"
  input: "gradients/bn_5/batchnorm/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/mul_grad/Sum_1"
  input: "gradients/bn_5/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/mul_grad/Reshape_1"
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/mul_grad/Reshape_1"
  input: "^gradients/bn_5/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "bn_5/batchnorm/Rsqrt"
  input: "gradients/bn_5/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Switch"
  op: "Switch"
  input: "bn_5/moments/Squeeze"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_1"
  op: "Shape"
  input: "gradients/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros"
  op: "Fill"
  input: "gradients/Shape_1"
  input: "gradients/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_5/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/zeros"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/batchnorm/add_grad/Shape"
  input: "gradients/bn_5/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_5/batchnorm/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/add_grad/Sum"
  input: "gradients/bn_5/batchnorm/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_5/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_5/batchnorm/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/batchnorm/add_grad/Sum_1"
  input: "gradients/bn_5/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_5/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/batchnorm/add_grad/Reshape_1"
  input: "^gradients/bn_5/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Squeeze_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Squeeze_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_5/moments/Squeeze_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/cond/Merge_1_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_5/batchnorm/add_grad/tuple/control_dependency"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/cond/Merge_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/cond/Merge_1_grad/cond_grad"
}
node {
  name: "gradients/bn_5/cond/Merge_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/cond/Merge_1_grad/cond_grad"
  input: "^gradients/bn_5/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/cond/Merge_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/cond/Merge_1_grad/cond_grad:1"
  input: "^gradients/bn_5/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/mean_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/mean_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/moments/mean_grad/Shape"
  input: "gradients/bn_5/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/mean_grad/Sum"
  op: "Sum"
  input: "gradients/bn_5/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_5/moments/mean_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/moments/mean_grad/Sum"
  input: "gradients/bn_5/moments/mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/mean_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_5/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_5/moments/mean_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/mean_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/moments/mean_grad/Sum_1"
  input: "gradients/bn_5/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/mean_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/moments/mean_grad/Reshape"
  input: "^gradients/bn_5/moments/mean_grad/Reshape_1"
}
node {
  name: "gradients/bn_5/moments/mean_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/moments/mean_grad/Reshape"
  input: "^gradients/bn_5/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/mean_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/moments/mean_grad/Reshape_1"
  input: "^gradients/bn_5/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_1"
  op: "Switch"
  input: "bn_5/moments/Squeeze_1"
  input: "bn_5/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_2"
  op: "Shape"
  input: "gradients/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_1"
  op: "Fill"
  input: "gradients/Shape_2"
  input: "gradients/zeros_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_5/cond/Merge_1_grad/tuple/control_dependency_1"
  input: "gradients/zeros_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/Squeeze_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Squeeze_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_5/moments/Squeeze_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/moments/variance_grad/Shape"
  input: "gradients/bn_5/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/Sum"
  op: "Sum"
  input: "gradients/bn_5/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_5/moments/variance_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/moments/variance_grad/Sum"
  input: "gradients/bn_5/moments/variance_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_5/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_5/moments/variance_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/Neg"
  op: "Neg"
  input: "gradients/bn_5/moments/variance_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/moments/variance_grad/Neg"
  input: "gradients/bn_5/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/moments/variance_grad/Reshape"
  input: "^gradients/bn_5/moments/variance_grad/Reshape_1"
}
node {
  name: "gradients/bn_5/moments/variance_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/moments/variance_grad/Reshape"
  input: "^gradients/bn_5/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/variance_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/variance_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/moments/variance_grad/Reshape_1"
  input: "^gradients/bn_5/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/variance_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Shape"
  op: "Shape"
  input: "bn_5/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/add"
  op: "Add"
  input: "bn_5/moments/Mean_1/reduction_indices"
  input: "gradients/bn_5/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_5/moments/Mean_1_grad/add"
  input: "gradients/bn_5/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/range"
  op: "Range"
  input: "gradients/bn_5/moments/Mean_1_grad/range/start"
  input: "gradients/bn_5/moments/Mean_1_grad/Size"
  input: "gradients/bn_5/moments/Mean_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Fill"
  op: "Fill"
  input: "gradients/bn_5/moments/Mean_1_grad/Shape_1"
  input: "gradients/bn_5/moments/Mean_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_5/moments/Mean_1_grad/range"
  input: "gradients/bn_5/moments/Mean_1_grad/mod"
  input: "gradients/bn_5/moments/Mean_1_grad/Shape"
  input: "gradients/bn_5/moments/Mean_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_5/moments/Mean_1_grad/DynamicStitch"
  input: "gradients/bn_5/moments/Mean_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_5/moments/Mean_1_grad/Shape"
  input: "gradients/bn_5/moments/Mean_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/moments/variance_grad/tuple/control_dependency"
  input: "gradients/bn_5/moments/Mean_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Tile"
  op: "Tile"
  input: "gradients/bn_5/moments/Mean_1_grad/Reshape"
  input: "gradients/bn_5/moments/Mean_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Shape_2"
  op: "Shape"
  input: "bn_5/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Prod"
  op: "Prod"
  input: "gradients/bn_5/moments/Mean_1_grad/Shape_2"
  input: "gradients/bn_5/moments/Mean_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_5/moments/Mean_1_grad/Shape_3"
  input: "gradients/bn_5/moments/Mean_1_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_5/moments/Mean_1_grad/Prod_1"
  input: "gradients/bn_5/moments/Mean_1_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_5/moments/Mean_1_grad/Prod"
  input: "gradients/bn_5/moments/Mean_1_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/Cast"
  op: "Cast"
  input: "gradients/bn_5/moments/Mean_1_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Mean_1_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_5/moments/Mean_1_grad/Tile"
  input: "gradients/bn_5/moments/Mean_1_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/Square_grad/mul/x"
  op: "Const"
  input: "^gradients/bn_5/moments/variance_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Square_grad/mul"
  op: "Mul"
  input: "gradients/bn_5/moments/Square_grad/mul/x"
  input: "bn_5/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/Square_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_5/moments/variance_grad/tuple/control_dependency_1"
  input: "gradients/bn_5/moments/Square_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/moments/SquaredDifference_grad/Shape"
  input: "gradients/bn_5/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/bn_5/moments/Mean_1_grad/truediv"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/mul"
  op: "Mul"
  input: "gradients/bn_5/moments/SquaredDifference_grad/scalar"
  input: "gradients/bn_5/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "add_5"
  input: "bn_5/moments/StopGradient"
  input: "^gradients/bn_5/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_5/moments/SquaredDifference_grad/mul"
  input: "gradients/bn_5/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/bn_5/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_5/moments/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/moments/SquaredDifference_grad/Sum"
  input: "gradients/bn_5/moments/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_5/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_5/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/bn_5/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/bn_5/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_5/moments/SquaredDifference_grad/Neg"
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_5/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/moments/SquaredDifference_grad/Neg"
  input: "^gradients/bn_5/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/AddN_1"
  op: "AddN"
  input: "gradients/bn_5/moments/mean_grad/tuple/control_dependency"
  input: "gradients/bn_5/moments/Square_grad/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Shape"
  op: "Shape"
  input: "bn_5/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/add"
  op: "Add"
  input: "bn_5/moments/shifted_mean/reduction_indices"
  input: "gradients/bn_5/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_5/moments/shifted_mean_grad/add"
  input: "gradients/bn_5/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/range"
  op: "Range"
  input: "gradients/bn_5/moments/shifted_mean_grad/range/start"
  input: "gradients/bn_5/moments/shifted_mean_grad/Size"
  input: "gradients/bn_5/moments/shifted_mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Fill"
  op: "Fill"
  input: "gradients/bn_5/moments/shifted_mean_grad/Shape_1"
  input: "gradients/bn_5/moments/shifted_mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_5/moments/shifted_mean_grad/range"
  input: "gradients/bn_5/moments/shifted_mean_grad/mod"
  input: "gradients/bn_5/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_5/moments/shifted_mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_5/moments/shifted_mean_grad/DynamicStitch"
  input: "gradients/bn_5/moments/shifted_mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_5/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_5/moments/shifted_mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN_1"
  input: "gradients/bn_5/moments/shifted_mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Tile"
  op: "Tile"
  input: "gradients/bn_5/moments/shifted_mean_grad/Reshape"
  input: "gradients/bn_5/moments/shifted_mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Shape_2"
  op: "Shape"
  input: "bn_5/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Prod"
  op: "Prod"
  input: "gradients/bn_5/moments/shifted_mean_grad/Shape_2"
  input: "gradients/bn_5/moments/shifted_mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_5/moments/shifted_mean_grad/Shape_3"
  input: "gradients/bn_5/moments/shifted_mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_5/moments/shifted_mean_grad/Prod_1"
  input: "gradients/bn_5/moments/shifted_mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_5/moments/shifted_mean_grad/Prod"
  input: "gradients/bn_5/moments/shifted_mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/Cast"
  op: "Cast"
  input: "gradients/bn_5/moments/shifted_mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/shifted_mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_5/moments/shifted_mean_grad/Tile"
  input: "gradients/bn_5/moments/shifted_mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/Shape"
  op: "Shape"
  input: "add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_5/moments/Sub_grad/Shape"
  input: "gradients/bn_5/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_5/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_5/moments/Sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_5/moments/Sub_grad/Sum"
  input: "gradients/bn_5/moments/Sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_5/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_5/moments/Sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_5/moments/Sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_5/moments/Sub_grad/Neg"
  input: "gradients/bn_5/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_5/moments/Sub_grad/Reshape"
  input: "^gradients/bn_5/moments/Sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_5/moments/Sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_5/moments/Sub_grad/Reshape"
  input: "^gradients/bn_5/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/Sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_5/moments/Sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_5/moments/Sub_grad/Reshape_1"
  input: "^gradients/bn_5/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/Sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_2"
  op: "AddN"
  input: "gradients/bn_5/moments/mean_grad/tuple/control_dependency_1"
  input: "gradients/bn_5/moments/SquaredDifference_grad/tuple/control_dependency_1"
  input: "gradients/bn_5/moments/Sub_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_3"
  op: "AddN"
  input: "gradients/bn_5/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/bn_5/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/bn_5/moments/Sub_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_5/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_5_grad/Shape"
  op: "Shape"
  input: "Conv2D_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/add_5_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_5_grad/Shape"
  input: "gradients/add_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_3"
  input: "gradients/add_5_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_5_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_5_grad/Sum"
  input: "gradients/add_5_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_3"
  input: "gradients/add_5_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_5_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_5_grad/Sum_1"
  input: "gradients/add_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_5_grad/Reshape"
  input: "^gradients/add_5_grad/Reshape_1"
}
node {
  name: "gradients/add_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_5_grad/Reshape"
  input: "^gradients/add_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_5_grad/Reshape_1"
  input: "^gradients/add_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_5_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/Shape"
  op: "Shape"
  input: "Relu_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_5_grad/Shape"
  input: "Variable_10/read"
  input: "gradients/add_5_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\024\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "Relu_4"
  input: "gradients/Conv2D_5_grad/Shape_1"
  input: "gradients/add_5_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_5_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_5_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_5_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_5_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_5_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_5_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Relu_4_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/Conv2D_5_grad/tuple/control_dependency"
  input: "Relu_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "bn_4/batchnorm/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/batchnorm/add_1_grad/Shape"
  input: "gradients/bn_4/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/Relu_4_grad/ReluGrad"
  input: "gradients/bn_4/batchnorm/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/add_1_grad/Sum"
  input: "gradients/bn_4/batchnorm/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/Relu_4_grad/ReluGrad"
  input: "gradients/bn_4/batchnorm/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/add_1_grad/Sum_1"
  input: "gradients/bn_4/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/bn_4/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/batchnorm/mul_1_grad/Shape"
  input: "gradients/bn_4/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/bn_4/batchnorm/add_1_grad/tuple/control_dependency"
  input: "bn_4/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/mul_1_grad/mul"
  input: "gradients/bn_4/batchnorm/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/mul_1_grad/Sum"
  input: "gradients/bn_4/batchnorm/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/mul_1"
  op: "Mul"
  input: "add_4"
  input: "gradients/bn_4/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/mul_1_grad/mul_1"
  input: "gradients/bn_4/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/bn_4/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/bn_4/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/batchnorm/sub_grad/Shape"
  input: "gradients/bn_4/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_4/batchnorm/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/sub_grad/Sum"
  input: "gradients/bn_4/batchnorm/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_4/batchnorm/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_4/batchnorm/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/sub_grad/Neg"
  input: "gradients/bn_4/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/sub_grad/Reshape_1"
  input: "^gradients/bn_4/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/batchnorm/mul_2_grad/Shape"
  input: "gradients/bn_4/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/mul"
  op: "Mul"
  input: "gradients/bn_4/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "bn_4/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/mul_2_grad/mul"
  input: "gradients/bn_4/batchnorm/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/mul_2_grad/Sum"
  input: "gradients/bn_4/batchnorm/mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/mul_1"
  op: "Mul"
  input: "bn_4/cond/Merge"
  input: "gradients/bn_4/batchnorm/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/mul_2_grad/mul_1"
  input: "gradients/bn_4/batchnorm/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/mul_2_grad/Sum_1"
  input: "gradients/bn_4/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/mul_2_grad/Reshape_1"
  input: "^gradients/bn_4/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_4/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_4/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/bn_4/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/cond/Merge_grad/cond_grad"
  input: "^gradients/bn_4/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/cond/Merge_grad/cond_grad:1"
  input: "^gradients/bn_4/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AddN_4"
  op: "AddN"
  input: "gradients/bn_4/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_4/batchnorm/mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/batchnorm/mul_grad/Shape"
  input: "gradients/bn_4/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/mul"
  op: "Mul"
  input: "gradients/AddN_4"
  input: "bn_4/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/Sum"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/mul_grad/mul"
  input: "gradients/bn_4/batchnorm/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/mul_grad/Sum"
  input: "gradients/bn_4/batchnorm/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/mul_1"
  op: "Mul"
  input: "bn_4/batchnorm/Rsqrt"
  input: "gradients/AddN_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/mul_grad/mul_1"
  input: "gradients/bn_4/batchnorm/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/mul_grad/Sum_1"
  input: "gradients/bn_4/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/mul_grad/Reshape_1"
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/mul_grad/Reshape_1"
  input: "^gradients/bn_4/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "bn_4/batchnorm/Rsqrt"
  input: "gradients/bn_4/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Switch_2"
  op: "Switch"
  input: "bn_4/moments/Squeeze"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_3"
  op: "Shape"
  input: "gradients/Switch_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_2"
  op: "Fill"
  input: "gradients/Shape_3"
  input: "gradients/zeros_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_4/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/zeros_2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/batchnorm/add_grad/Shape"
  input: "gradients/bn_4/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_4/batchnorm/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/add_grad/Sum"
  input: "gradients/bn_4/batchnorm/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_4/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_4/batchnorm/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/batchnorm/add_grad/Sum_1"
  input: "gradients/bn_4/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_4/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/batchnorm/add_grad/Reshape_1"
  input: "^gradients/bn_4/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Squeeze_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Squeeze_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_4/moments/Squeeze_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/cond/Merge_1_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_4/batchnorm/add_grad/tuple/control_dependency"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/cond/Merge_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/cond/Merge_1_grad/cond_grad"
}
node {
  name: "gradients/bn_4/cond/Merge_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/cond/Merge_1_grad/cond_grad"
  input: "^gradients/bn_4/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/cond/Merge_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/cond/Merge_1_grad/cond_grad:1"
  input: "^gradients/bn_4/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/mean_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/mean_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/moments/mean_grad/Shape"
  input: "gradients/bn_4/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/mean_grad/Sum"
  op: "Sum"
  input: "gradients/bn_4/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_4/moments/mean_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/moments/mean_grad/Sum"
  input: "gradients/bn_4/moments/mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/mean_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_4/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_4/moments/mean_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/mean_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/moments/mean_grad/Sum_1"
  input: "gradients/bn_4/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/mean_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/moments/mean_grad/Reshape"
  input: "^gradients/bn_4/moments/mean_grad/Reshape_1"
}
node {
  name: "gradients/bn_4/moments/mean_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/moments/mean_grad/Reshape"
  input: "^gradients/bn_4/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/mean_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/moments/mean_grad/Reshape_1"
  input: "^gradients/bn_4/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_3"
  op: "Switch"
  input: "bn_4/moments/Squeeze_1"
  input: "bn_4/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_4"
  op: "Shape"
  input: "gradients/Switch_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_3"
  op: "Fill"
  input: "gradients/Shape_4"
  input: "gradients/zeros_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_4/cond/Merge_1_grad/tuple/control_dependency_1"
  input: "gradients/zeros_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/Squeeze_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Squeeze_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_4/moments/Squeeze_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/moments/variance_grad/Shape"
  input: "gradients/bn_4/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/Sum"
  op: "Sum"
  input: "gradients/bn_4/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_4/moments/variance_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/moments/variance_grad/Sum"
  input: "gradients/bn_4/moments/variance_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_4/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_4/moments/variance_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/Neg"
  op: "Neg"
  input: "gradients/bn_4/moments/variance_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/moments/variance_grad/Neg"
  input: "gradients/bn_4/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/moments/variance_grad/Reshape"
  input: "^gradients/bn_4/moments/variance_grad/Reshape_1"
}
node {
  name: "gradients/bn_4/moments/variance_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/moments/variance_grad/Reshape"
  input: "^gradients/bn_4/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/variance_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/variance_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/moments/variance_grad/Reshape_1"
  input: "^gradients/bn_4/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/variance_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Shape"
  op: "Shape"
  input: "bn_4/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/add"
  op: "Add"
  input: "bn_4/moments/Mean_1/reduction_indices"
  input: "gradients/bn_4/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_4/moments/Mean_1_grad/add"
  input: "gradients/bn_4/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/range"
  op: "Range"
  input: "gradients/bn_4/moments/Mean_1_grad/range/start"
  input: "gradients/bn_4/moments/Mean_1_grad/Size"
  input: "gradients/bn_4/moments/Mean_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Fill"
  op: "Fill"
  input: "gradients/bn_4/moments/Mean_1_grad/Shape_1"
  input: "gradients/bn_4/moments/Mean_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_4/moments/Mean_1_grad/range"
  input: "gradients/bn_4/moments/Mean_1_grad/mod"
  input: "gradients/bn_4/moments/Mean_1_grad/Shape"
  input: "gradients/bn_4/moments/Mean_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_4/moments/Mean_1_grad/DynamicStitch"
  input: "gradients/bn_4/moments/Mean_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_4/moments/Mean_1_grad/Shape"
  input: "gradients/bn_4/moments/Mean_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/moments/variance_grad/tuple/control_dependency"
  input: "gradients/bn_4/moments/Mean_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Tile"
  op: "Tile"
  input: "gradients/bn_4/moments/Mean_1_grad/Reshape"
  input: "gradients/bn_4/moments/Mean_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Shape_2"
  op: "Shape"
  input: "bn_4/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Prod"
  op: "Prod"
  input: "gradients/bn_4/moments/Mean_1_grad/Shape_2"
  input: "gradients/bn_4/moments/Mean_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_4/moments/Mean_1_grad/Shape_3"
  input: "gradients/bn_4/moments/Mean_1_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_4/moments/Mean_1_grad/Prod_1"
  input: "gradients/bn_4/moments/Mean_1_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_4/moments/Mean_1_grad/Prod"
  input: "gradients/bn_4/moments/Mean_1_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/Cast"
  op: "Cast"
  input: "gradients/bn_4/moments/Mean_1_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Mean_1_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_4/moments/Mean_1_grad/Tile"
  input: "gradients/bn_4/moments/Mean_1_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/Square_grad/mul/x"
  op: "Const"
  input: "^gradients/bn_4/moments/variance_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Square_grad/mul"
  op: "Mul"
  input: "gradients/bn_4/moments/Square_grad/mul/x"
  input: "bn_4/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/Square_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_4/moments/variance_grad/tuple/control_dependency_1"
  input: "gradients/bn_4/moments/Square_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/moments/SquaredDifference_grad/Shape"
  input: "gradients/bn_4/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/bn_4/moments/Mean_1_grad/truediv"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/mul"
  op: "Mul"
  input: "gradients/bn_4/moments/SquaredDifference_grad/scalar"
  input: "gradients/bn_4/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "add_4"
  input: "bn_4/moments/StopGradient"
  input: "^gradients/bn_4/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_4/moments/SquaredDifference_grad/mul"
  input: "gradients/bn_4/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/bn_4/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_4/moments/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/moments/SquaredDifference_grad/Sum"
  input: "gradients/bn_4/moments/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_4/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_4/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/bn_4/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/bn_4/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_4/moments/SquaredDifference_grad/Neg"
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_4/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/moments/SquaredDifference_grad/Neg"
  input: "^gradients/bn_4/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/AddN_5"
  op: "AddN"
  input: "gradients/bn_4/moments/mean_grad/tuple/control_dependency"
  input: "gradients/bn_4/moments/Square_grad/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Shape"
  op: "Shape"
  input: "bn_4/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/add"
  op: "Add"
  input: "bn_4/moments/shifted_mean/reduction_indices"
  input: "gradients/bn_4/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_4/moments/shifted_mean_grad/add"
  input: "gradients/bn_4/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/range"
  op: "Range"
  input: "gradients/bn_4/moments/shifted_mean_grad/range/start"
  input: "gradients/bn_4/moments/shifted_mean_grad/Size"
  input: "gradients/bn_4/moments/shifted_mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Fill"
  op: "Fill"
  input: "gradients/bn_4/moments/shifted_mean_grad/Shape_1"
  input: "gradients/bn_4/moments/shifted_mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_4/moments/shifted_mean_grad/range"
  input: "gradients/bn_4/moments/shifted_mean_grad/mod"
  input: "gradients/bn_4/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_4/moments/shifted_mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_4/moments/shifted_mean_grad/DynamicStitch"
  input: "gradients/bn_4/moments/shifted_mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_4/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_4/moments/shifted_mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN_5"
  input: "gradients/bn_4/moments/shifted_mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Tile"
  op: "Tile"
  input: "gradients/bn_4/moments/shifted_mean_grad/Reshape"
  input: "gradients/bn_4/moments/shifted_mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Shape_2"
  op: "Shape"
  input: "bn_4/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Prod"
  op: "Prod"
  input: "gradients/bn_4/moments/shifted_mean_grad/Shape_2"
  input: "gradients/bn_4/moments/shifted_mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_4/moments/shifted_mean_grad/Shape_3"
  input: "gradients/bn_4/moments/shifted_mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_4/moments/shifted_mean_grad/Prod_1"
  input: "gradients/bn_4/moments/shifted_mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_4/moments/shifted_mean_grad/Prod"
  input: "gradients/bn_4/moments/shifted_mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/Cast"
  op: "Cast"
  input: "gradients/bn_4/moments/shifted_mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/shifted_mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_4/moments/shifted_mean_grad/Tile"
  input: "gradients/bn_4/moments/shifted_mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/Shape"
  op: "Shape"
  input: "add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_4/moments/Sub_grad/Shape"
  input: "gradients/bn_4/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_4/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_4/moments/Sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_4/moments/Sub_grad/Sum"
  input: "gradients/bn_4/moments/Sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_4/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_4/moments/Sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_4/moments/Sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_4/moments/Sub_grad/Neg"
  input: "gradients/bn_4/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_4/moments/Sub_grad/Reshape"
  input: "^gradients/bn_4/moments/Sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_4/moments/Sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_4/moments/Sub_grad/Reshape"
  input: "^gradients/bn_4/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/Sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_4/moments/Sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_4/moments/Sub_grad/Reshape_1"
  input: "^gradients/bn_4/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/Sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_6"
  op: "AddN"
  input: "gradients/bn_4/moments/mean_grad/tuple/control_dependency_1"
  input: "gradients/bn_4/moments/SquaredDifference_grad/tuple/control_dependency_1"
  input: "gradients/bn_4/moments/Sub_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_7"
  op: "AddN"
  input: "gradients/bn_4/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/bn_4/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/bn_4/moments/Sub_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_4/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_4_grad/Shape"
  op: "Shape"
  input: "Conv2D_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/add_4_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_4_grad/Shape"
  input: "gradients/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_7"
  input: "gradients/add_4_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_4_grad/Sum"
  input: "gradients/add_4_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_7"
  input: "gradients/add_4_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_4_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_4_grad/Sum_1"
  input: "gradients/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_4_grad/Reshape"
  input: "^gradients/add_4_grad/Reshape_1"
}
node {
  name: "gradients/add_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_4_grad/Reshape"
  input: "^gradients/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_4_grad/Reshape_1"
  input: "^gradients/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/Shape"
  op: "Shape"
  input: "Relu_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_4_grad/Shape"
  input: "Variable_8/read"
  input: "gradients/add_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\024\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "Relu_3"
  input: "gradients/Conv2D_4_grad/Shape_1"
  input: "gradients/add_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_4_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_4_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_4_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_4_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_4_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_4_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Relu_3_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/Conv2D_4_grad/tuple/control_dependency"
  input: "Relu_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "bn_3/batchnorm/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/batchnorm/add_1_grad/Shape"
  input: "gradients/bn_3/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/Relu_3_grad/ReluGrad"
  input: "gradients/bn_3/batchnorm/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/add_1_grad/Sum"
  input: "gradients/bn_3/batchnorm/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/Relu_3_grad/ReluGrad"
  input: "gradients/bn_3/batchnorm/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/add_1_grad/Sum_1"
  input: "gradients/bn_3/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/bn_3/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/batchnorm/mul_1_grad/Shape"
  input: "gradients/bn_3/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/bn_3/batchnorm/add_1_grad/tuple/control_dependency"
  input: "bn_3/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/mul_1_grad/mul"
  input: "gradients/bn_3/batchnorm/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/mul_1_grad/Sum"
  input: "gradients/bn_3/batchnorm/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/mul_1"
  op: "Mul"
  input: "add_3"
  input: "gradients/bn_3/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/mul_1_grad/mul_1"
  input: "gradients/bn_3/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/bn_3/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/bn_3/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/batchnorm/sub_grad/Shape"
  input: "gradients/bn_3/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_3/batchnorm/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/sub_grad/Sum"
  input: "gradients/bn_3/batchnorm/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_3/batchnorm/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_3/batchnorm/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/sub_grad/Neg"
  input: "gradients/bn_3/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/sub_grad/Reshape_1"
  input: "^gradients/bn_3/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/batchnorm/mul_2_grad/Shape"
  input: "gradients/bn_3/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/mul"
  op: "Mul"
  input: "gradients/bn_3/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "bn_3/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/mul_2_grad/mul"
  input: "gradients/bn_3/batchnorm/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/mul_2_grad/Sum"
  input: "gradients/bn_3/batchnorm/mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/mul_1"
  op: "Mul"
  input: "bn_3/cond/Merge"
  input: "gradients/bn_3/batchnorm/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/mul_2_grad/mul_1"
  input: "gradients/bn_3/batchnorm/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/mul_2_grad/Sum_1"
  input: "gradients/bn_3/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/mul_2_grad/Reshape_1"
  input: "^gradients/bn_3/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_3/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_3/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/bn_3/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/cond/Merge_grad/cond_grad"
  input: "^gradients/bn_3/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/cond/Merge_grad/cond_grad:1"
  input: "^gradients/bn_3/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AddN_8"
  op: "AddN"
  input: "gradients/bn_3/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_3/batchnorm/mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/batchnorm/mul_grad/Shape"
  input: "gradients/bn_3/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/mul"
  op: "Mul"
  input: "gradients/AddN_8"
  input: "bn_3/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/Sum"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/mul_grad/mul"
  input: "gradients/bn_3/batchnorm/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/mul_grad/Sum"
  input: "gradients/bn_3/batchnorm/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/mul_1"
  op: "Mul"
  input: "bn_3/batchnorm/Rsqrt"
  input: "gradients/AddN_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/mul_grad/mul_1"
  input: "gradients/bn_3/batchnorm/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/mul_grad/Sum_1"
  input: "gradients/bn_3/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/mul_grad/Reshape_1"
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/mul_grad/Reshape_1"
  input: "^gradients/bn_3/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "bn_3/batchnorm/Rsqrt"
  input: "gradients/bn_3/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Switch_4"
  op: "Switch"
  input: "bn_3/moments/Squeeze"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_5"
  op: "Shape"
  input: "gradients/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_4"
  op: "Fill"
  input: "gradients/Shape_5"
  input: "gradients/zeros_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_3/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/zeros_4"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/batchnorm/add_grad/Shape"
  input: "gradients/bn_3/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_3/batchnorm/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/add_grad/Sum"
  input: "gradients/bn_3/batchnorm/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_3/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_3/batchnorm/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/batchnorm/add_grad/Sum_1"
  input: "gradients/bn_3/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_3/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/batchnorm/add_grad/Reshape_1"
  input: "^gradients/bn_3/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Squeeze_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Squeeze_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_3/moments/Squeeze_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/cond/Merge_1_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_3/batchnorm/add_grad/tuple/control_dependency"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/cond/Merge_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/cond/Merge_1_grad/cond_grad"
}
node {
  name: "gradients/bn_3/cond/Merge_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/cond/Merge_1_grad/cond_grad"
  input: "^gradients/bn_3/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/cond/Merge_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/cond/Merge_1_grad/cond_grad:1"
  input: "^gradients/bn_3/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/mean_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/mean_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/moments/mean_grad/Shape"
  input: "gradients/bn_3/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/mean_grad/Sum"
  op: "Sum"
  input: "gradients/bn_3/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_3/moments/mean_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/moments/mean_grad/Sum"
  input: "gradients/bn_3/moments/mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/mean_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_3/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_3/moments/mean_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/mean_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/moments/mean_grad/Sum_1"
  input: "gradients/bn_3/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/mean_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/moments/mean_grad/Reshape"
  input: "^gradients/bn_3/moments/mean_grad/Reshape_1"
}
node {
  name: "gradients/bn_3/moments/mean_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/moments/mean_grad/Reshape"
  input: "^gradients/bn_3/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/mean_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/moments/mean_grad/Reshape_1"
  input: "^gradients/bn_3/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_5"
  op: "Switch"
  input: "bn_3/moments/Squeeze_1"
  input: "bn_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_6"
  op: "Shape"
  input: "gradients/Switch_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_5/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_5"
  op: "Fill"
  input: "gradients/Shape_6"
  input: "gradients/zeros_5/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_3/cond/Merge_1_grad/tuple/control_dependency_1"
  input: "gradients/zeros_5"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/Squeeze_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Squeeze_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_3/moments/Squeeze_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/moments/variance_grad/Shape"
  input: "gradients/bn_3/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/Sum"
  op: "Sum"
  input: "gradients/bn_3/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_3/moments/variance_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/moments/variance_grad/Sum"
  input: "gradients/bn_3/moments/variance_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_3/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_3/moments/variance_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/Neg"
  op: "Neg"
  input: "gradients/bn_3/moments/variance_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/moments/variance_grad/Neg"
  input: "gradients/bn_3/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/moments/variance_grad/Reshape"
  input: "^gradients/bn_3/moments/variance_grad/Reshape_1"
}
node {
  name: "gradients/bn_3/moments/variance_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/moments/variance_grad/Reshape"
  input: "^gradients/bn_3/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/variance_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/variance_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/moments/variance_grad/Reshape_1"
  input: "^gradients/bn_3/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/variance_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Shape"
  op: "Shape"
  input: "bn_3/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/add"
  op: "Add"
  input: "bn_3/moments/Mean_1/reduction_indices"
  input: "gradients/bn_3/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_3/moments/Mean_1_grad/add"
  input: "gradients/bn_3/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/range"
  op: "Range"
  input: "gradients/bn_3/moments/Mean_1_grad/range/start"
  input: "gradients/bn_3/moments/Mean_1_grad/Size"
  input: "gradients/bn_3/moments/Mean_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Fill"
  op: "Fill"
  input: "gradients/bn_3/moments/Mean_1_grad/Shape_1"
  input: "gradients/bn_3/moments/Mean_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_3/moments/Mean_1_grad/range"
  input: "gradients/bn_3/moments/Mean_1_grad/mod"
  input: "gradients/bn_3/moments/Mean_1_grad/Shape"
  input: "gradients/bn_3/moments/Mean_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_3/moments/Mean_1_grad/DynamicStitch"
  input: "gradients/bn_3/moments/Mean_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_3/moments/Mean_1_grad/Shape"
  input: "gradients/bn_3/moments/Mean_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/moments/variance_grad/tuple/control_dependency"
  input: "gradients/bn_3/moments/Mean_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Tile"
  op: "Tile"
  input: "gradients/bn_3/moments/Mean_1_grad/Reshape"
  input: "gradients/bn_3/moments/Mean_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Shape_2"
  op: "Shape"
  input: "bn_3/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Prod"
  op: "Prod"
  input: "gradients/bn_3/moments/Mean_1_grad/Shape_2"
  input: "gradients/bn_3/moments/Mean_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_3/moments/Mean_1_grad/Shape_3"
  input: "gradients/bn_3/moments/Mean_1_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_3/moments/Mean_1_grad/Prod_1"
  input: "gradients/bn_3/moments/Mean_1_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_3/moments/Mean_1_grad/Prod"
  input: "gradients/bn_3/moments/Mean_1_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/Cast"
  op: "Cast"
  input: "gradients/bn_3/moments/Mean_1_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Mean_1_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_3/moments/Mean_1_grad/Tile"
  input: "gradients/bn_3/moments/Mean_1_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/Square_grad/mul/x"
  op: "Const"
  input: "^gradients/bn_3/moments/variance_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Square_grad/mul"
  op: "Mul"
  input: "gradients/bn_3/moments/Square_grad/mul/x"
  input: "bn_3/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/Square_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_3/moments/variance_grad/tuple/control_dependency_1"
  input: "gradients/bn_3/moments/Square_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/moments/SquaredDifference_grad/Shape"
  input: "gradients/bn_3/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/bn_3/moments/Mean_1_grad/truediv"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/mul"
  op: "Mul"
  input: "gradients/bn_3/moments/SquaredDifference_grad/scalar"
  input: "gradients/bn_3/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "add_3"
  input: "bn_3/moments/StopGradient"
  input: "^gradients/bn_3/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_3/moments/SquaredDifference_grad/mul"
  input: "gradients/bn_3/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/bn_3/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_3/moments/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/moments/SquaredDifference_grad/Sum"
  input: "gradients/bn_3/moments/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_3/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_3/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/bn_3/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/bn_3/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_3/moments/SquaredDifference_grad/Neg"
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_3/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/moments/SquaredDifference_grad/Neg"
  input: "^gradients/bn_3/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/AddN_9"
  op: "AddN"
  input: "gradients/bn_3/moments/mean_grad/tuple/control_dependency"
  input: "gradients/bn_3/moments/Square_grad/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Shape"
  op: "Shape"
  input: "bn_3/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/add"
  op: "Add"
  input: "bn_3/moments/shifted_mean/reduction_indices"
  input: "gradients/bn_3/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_3/moments/shifted_mean_grad/add"
  input: "gradients/bn_3/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/range"
  op: "Range"
  input: "gradients/bn_3/moments/shifted_mean_grad/range/start"
  input: "gradients/bn_3/moments/shifted_mean_grad/Size"
  input: "gradients/bn_3/moments/shifted_mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Fill"
  op: "Fill"
  input: "gradients/bn_3/moments/shifted_mean_grad/Shape_1"
  input: "gradients/bn_3/moments/shifted_mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_3/moments/shifted_mean_grad/range"
  input: "gradients/bn_3/moments/shifted_mean_grad/mod"
  input: "gradients/bn_3/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_3/moments/shifted_mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_3/moments/shifted_mean_grad/DynamicStitch"
  input: "gradients/bn_3/moments/shifted_mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_3/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_3/moments/shifted_mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN_9"
  input: "gradients/bn_3/moments/shifted_mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Tile"
  op: "Tile"
  input: "gradients/bn_3/moments/shifted_mean_grad/Reshape"
  input: "gradients/bn_3/moments/shifted_mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Shape_2"
  op: "Shape"
  input: "bn_3/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Prod"
  op: "Prod"
  input: "gradients/bn_3/moments/shifted_mean_grad/Shape_2"
  input: "gradients/bn_3/moments/shifted_mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_3/moments/shifted_mean_grad/Shape_3"
  input: "gradients/bn_3/moments/shifted_mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_3/moments/shifted_mean_grad/Prod_1"
  input: "gradients/bn_3/moments/shifted_mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_3/moments/shifted_mean_grad/Prod"
  input: "gradients/bn_3/moments/shifted_mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/Cast"
  op: "Cast"
  input: "gradients/bn_3/moments/shifted_mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/shifted_mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_3/moments/shifted_mean_grad/Tile"
  input: "gradients/bn_3/moments/shifted_mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/Shape"
  op: "Shape"
  input: "add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_3/moments/Sub_grad/Shape"
  input: "gradients/bn_3/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_3/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_3/moments/Sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_3/moments/Sub_grad/Sum"
  input: "gradients/bn_3/moments/Sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_3/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_3/moments/Sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_3/moments/Sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_3/moments/Sub_grad/Neg"
  input: "gradients/bn_3/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_3/moments/Sub_grad/Reshape"
  input: "^gradients/bn_3/moments/Sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_3/moments/Sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_3/moments/Sub_grad/Reshape"
  input: "^gradients/bn_3/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/Sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_3/moments/Sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_3/moments/Sub_grad/Reshape_1"
  input: "^gradients/bn_3/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/Sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_10"
  op: "AddN"
  input: "gradients/bn_3/moments/mean_grad/tuple/control_dependency_1"
  input: "gradients/bn_3/moments/SquaredDifference_grad/tuple/control_dependency_1"
  input: "gradients/bn_3/moments/Sub_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_11"
  op: "AddN"
  input: "gradients/bn_3/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/bn_3/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/bn_3/moments/Sub_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_3/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_3_grad/Shape"
  op: "Shape"
  input: "Conv2D_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "gradients/add_3_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_3_grad/Shape"
  input: "gradients/add_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_11"
  input: "gradients/add_3_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_3_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_3_grad/Sum"
  input: "gradients/add_3_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_11"
  input: "gradients/add_3_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_3_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_3_grad/Sum_1"
  input: "gradients/add_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_3_grad/Reshape"
  input: "^gradients/add_3_grad/Reshape_1"
}
node {
  name: "gradients/add_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_3_grad/Reshape"
  input: "^gradients/add_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_3_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_3_grad/Reshape_1"
  input: "^gradients/add_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_3_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/Shape"
  op: "Shape"
  input: "Relu_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_3_grad/Shape"
  input: "Variable_6/read"
  input: "gradients/add_3_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "Relu_2"
  input: "gradients/Conv2D_3_grad/Shape_1"
  input: "gradients/add_3_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_3_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_3_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_3_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_3_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_3_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_3_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Relu_2_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/Conv2D_3_grad/tuple/control_dependency"
  input: "Relu_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "bn_2/batchnorm/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/batchnorm/add_1_grad/Shape"
  input: "gradients/bn_2/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/Relu_2_grad/ReluGrad"
  input: "gradients/bn_2/batchnorm/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/add_1_grad/Sum"
  input: "gradients/bn_2/batchnorm/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/Relu_2_grad/ReluGrad"
  input: "gradients/bn_2/batchnorm/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/add_1_grad/Sum_1"
  input: "gradients/bn_2/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/bn_2/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/batchnorm/mul_1_grad/Shape"
  input: "gradients/bn_2/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/bn_2/batchnorm/add_1_grad/tuple/control_dependency"
  input: "bn_2/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/mul_1_grad/mul"
  input: "gradients/bn_2/batchnorm/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/mul_1_grad/Sum"
  input: "gradients/bn_2/batchnorm/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/mul_1"
  op: "Mul"
  input: "add_2"
  input: "gradients/bn_2/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/mul_1_grad/mul_1"
  input: "gradients/bn_2/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/bn_2/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/bn_2/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/batchnorm/sub_grad/Shape"
  input: "gradients/bn_2/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_2/batchnorm/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/sub_grad/Sum"
  input: "gradients/bn_2/batchnorm/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_2/batchnorm/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_2/batchnorm/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/sub_grad/Neg"
  input: "gradients/bn_2/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/sub_grad/Reshape_1"
  input: "^gradients/bn_2/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/batchnorm/mul_2_grad/Shape"
  input: "gradients/bn_2/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/mul"
  op: "Mul"
  input: "gradients/bn_2/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "bn_2/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/mul_2_grad/mul"
  input: "gradients/bn_2/batchnorm/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/mul_2_grad/Sum"
  input: "gradients/bn_2/batchnorm/mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/mul_1"
  op: "Mul"
  input: "bn_2/cond/Merge"
  input: "gradients/bn_2/batchnorm/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/mul_2_grad/mul_1"
  input: "gradients/bn_2/batchnorm/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/mul_2_grad/Sum_1"
  input: "gradients/bn_2/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/mul_2_grad/Reshape_1"
  input: "^gradients/bn_2/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_2/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_2/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/bn_2/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/cond/Merge_grad/cond_grad"
  input: "^gradients/bn_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/cond/Merge_grad/cond_grad:1"
  input: "^gradients/bn_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AddN_12"
  op: "AddN"
  input: "gradients/bn_2/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_2/batchnorm/mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/batchnorm/mul_grad/Shape"
  input: "gradients/bn_2/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/mul"
  op: "Mul"
  input: "gradients/AddN_12"
  input: "bn_2/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/Sum"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/mul_grad/mul"
  input: "gradients/bn_2/batchnorm/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/mul_grad/Sum"
  input: "gradients/bn_2/batchnorm/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/mul_1"
  op: "Mul"
  input: "bn_2/batchnorm/Rsqrt"
  input: "gradients/AddN_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/mul_grad/mul_1"
  input: "gradients/bn_2/batchnorm/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/mul_grad/Sum_1"
  input: "gradients/bn_2/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/mul_grad/Reshape_1"
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/mul_grad/Reshape_1"
  input: "^gradients/bn_2/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "bn_2/batchnorm/Rsqrt"
  input: "gradients/bn_2/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Switch_6"
  op: "Switch"
  input: "bn_2/moments/Squeeze"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_7"
  op: "Shape"
  input: "gradients/Switch_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_6/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_6"
  op: "Fill"
  input: "gradients/Shape_7"
  input: "gradients/zeros_6/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_2/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/zeros_6"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/batchnorm/add_grad/Shape"
  input: "gradients/bn_2/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_2/batchnorm/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/add_grad/Sum"
  input: "gradients/bn_2/batchnorm/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_2/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_2/batchnorm/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/batchnorm/add_grad/Sum_1"
  input: "gradients/bn_2/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_2/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/batchnorm/add_grad/Reshape_1"
  input: "^gradients/bn_2/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Squeeze_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Squeeze_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_2/moments/Squeeze_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/cond/Merge_1_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_2/batchnorm/add_grad/tuple/control_dependency"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/cond/Merge_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/cond/Merge_1_grad/cond_grad"
}
node {
  name: "gradients/bn_2/cond/Merge_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/cond/Merge_1_grad/cond_grad"
  input: "^gradients/bn_2/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/cond/Merge_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/cond/Merge_1_grad/cond_grad:1"
  input: "^gradients/bn_2/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/mean_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/mean_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/moments/mean_grad/Shape"
  input: "gradients/bn_2/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/mean_grad/Sum"
  op: "Sum"
  input: "gradients/bn_2/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_2/moments/mean_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/moments/mean_grad/Sum"
  input: "gradients/bn_2/moments/mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/mean_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_2/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_2/moments/mean_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/mean_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/moments/mean_grad/Sum_1"
  input: "gradients/bn_2/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/mean_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/moments/mean_grad/Reshape"
  input: "^gradients/bn_2/moments/mean_grad/Reshape_1"
}
node {
  name: "gradients/bn_2/moments/mean_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/moments/mean_grad/Reshape"
  input: "^gradients/bn_2/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/mean_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/moments/mean_grad/Reshape_1"
  input: "^gradients/bn_2/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_7"
  op: "Switch"
  input: "bn_2/moments/Squeeze_1"
  input: "bn_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_8"
  op: "Shape"
  input: "gradients/Switch_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_7/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_7"
  op: "Fill"
  input: "gradients/Shape_8"
  input: "gradients/zeros_7/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_2/cond/Merge_1_grad/tuple/control_dependency_1"
  input: "gradients/zeros_7"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/Squeeze_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Squeeze_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_2/moments/Squeeze_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/moments/variance_grad/Shape"
  input: "gradients/bn_2/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/Sum"
  op: "Sum"
  input: "gradients/bn_2/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_2/moments/variance_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/moments/variance_grad/Sum"
  input: "gradients/bn_2/moments/variance_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_2/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_2/moments/variance_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/Neg"
  op: "Neg"
  input: "gradients/bn_2/moments/variance_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/moments/variance_grad/Neg"
  input: "gradients/bn_2/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/moments/variance_grad/Reshape"
  input: "^gradients/bn_2/moments/variance_grad/Reshape_1"
}
node {
  name: "gradients/bn_2/moments/variance_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/moments/variance_grad/Reshape"
  input: "^gradients/bn_2/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/variance_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/variance_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/moments/variance_grad/Reshape_1"
  input: "^gradients/bn_2/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/variance_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Shape"
  op: "Shape"
  input: "bn_2/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/add"
  op: "Add"
  input: "bn_2/moments/Mean_1/reduction_indices"
  input: "gradients/bn_2/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_2/moments/Mean_1_grad/add"
  input: "gradients/bn_2/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/range"
  op: "Range"
  input: "gradients/bn_2/moments/Mean_1_grad/range/start"
  input: "gradients/bn_2/moments/Mean_1_grad/Size"
  input: "gradients/bn_2/moments/Mean_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Fill"
  op: "Fill"
  input: "gradients/bn_2/moments/Mean_1_grad/Shape_1"
  input: "gradients/bn_2/moments/Mean_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_2/moments/Mean_1_grad/range"
  input: "gradients/bn_2/moments/Mean_1_grad/mod"
  input: "gradients/bn_2/moments/Mean_1_grad/Shape"
  input: "gradients/bn_2/moments/Mean_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_2/moments/Mean_1_grad/DynamicStitch"
  input: "gradients/bn_2/moments/Mean_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_2/moments/Mean_1_grad/Shape"
  input: "gradients/bn_2/moments/Mean_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/moments/variance_grad/tuple/control_dependency"
  input: "gradients/bn_2/moments/Mean_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Tile"
  op: "Tile"
  input: "gradients/bn_2/moments/Mean_1_grad/Reshape"
  input: "gradients/bn_2/moments/Mean_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Shape_2"
  op: "Shape"
  input: "bn_2/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Prod"
  op: "Prod"
  input: "gradients/bn_2/moments/Mean_1_grad/Shape_2"
  input: "gradients/bn_2/moments/Mean_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_2/moments/Mean_1_grad/Shape_3"
  input: "gradients/bn_2/moments/Mean_1_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_2/moments/Mean_1_grad/Prod_1"
  input: "gradients/bn_2/moments/Mean_1_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_2/moments/Mean_1_grad/Prod"
  input: "gradients/bn_2/moments/Mean_1_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/Cast"
  op: "Cast"
  input: "gradients/bn_2/moments/Mean_1_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Mean_1_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_2/moments/Mean_1_grad/Tile"
  input: "gradients/bn_2/moments/Mean_1_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/Square_grad/mul/x"
  op: "Const"
  input: "^gradients/bn_2/moments/variance_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Square_grad/mul"
  op: "Mul"
  input: "gradients/bn_2/moments/Square_grad/mul/x"
  input: "bn_2/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/Square_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_2/moments/variance_grad/tuple/control_dependency_1"
  input: "gradients/bn_2/moments/Square_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/moments/SquaredDifference_grad/Shape"
  input: "gradients/bn_2/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/bn_2/moments/Mean_1_grad/truediv"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/mul"
  op: "Mul"
  input: "gradients/bn_2/moments/SquaredDifference_grad/scalar"
  input: "gradients/bn_2/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "add_2"
  input: "bn_2/moments/StopGradient"
  input: "^gradients/bn_2/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_2/moments/SquaredDifference_grad/mul"
  input: "gradients/bn_2/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/bn_2/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_2/moments/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/moments/SquaredDifference_grad/Sum"
  input: "gradients/bn_2/moments/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_2/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_2/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/bn_2/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/bn_2/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_2/moments/SquaredDifference_grad/Neg"
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_2/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/moments/SquaredDifference_grad/Neg"
  input: "^gradients/bn_2/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/AddN_13"
  op: "AddN"
  input: "gradients/bn_2/moments/mean_grad/tuple/control_dependency"
  input: "gradients/bn_2/moments/Square_grad/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Shape"
  op: "Shape"
  input: "bn_2/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/add"
  op: "Add"
  input: "bn_2/moments/shifted_mean/reduction_indices"
  input: "gradients/bn_2/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_2/moments/shifted_mean_grad/add"
  input: "gradients/bn_2/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/range"
  op: "Range"
  input: "gradients/bn_2/moments/shifted_mean_grad/range/start"
  input: "gradients/bn_2/moments/shifted_mean_grad/Size"
  input: "gradients/bn_2/moments/shifted_mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Fill"
  op: "Fill"
  input: "gradients/bn_2/moments/shifted_mean_grad/Shape_1"
  input: "gradients/bn_2/moments/shifted_mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_2/moments/shifted_mean_grad/range"
  input: "gradients/bn_2/moments/shifted_mean_grad/mod"
  input: "gradients/bn_2/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_2/moments/shifted_mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_2/moments/shifted_mean_grad/DynamicStitch"
  input: "gradients/bn_2/moments/shifted_mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_2/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_2/moments/shifted_mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN_13"
  input: "gradients/bn_2/moments/shifted_mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Tile"
  op: "Tile"
  input: "gradients/bn_2/moments/shifted_mean_grad/Reshape"
  input: "gradients/bn_2/moments/shifted_mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Shape_2"
  op: "Shape"
  input: "bn_2/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Prod"
  op: "Prod"
  input: "gradients/bn_2/moments/shifted_mean_grad/Shape_2"
  input: "gradients/bn_2/moments/shifted_mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_2/moments/shifted_mean_grad/Shape_3"
  input: "gradients/bn_2/moments/shifted_mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_2/moments/shifted_mean_grad/Prod_1"
  input: "gradients/bn_2/moments/shifted_mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_2/moments/shifted_mean_grad/Prod"
  input: "gradients/bn_2/moments/shifted_mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/Cast"
  op: "Cast"
  input: "gradients/bn_2/moments/shifted_mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/shifted_mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_2/moments/shifted_mean_grad/Tile"
  input: "gradients/bn_2/moments/shifted_mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/Shape"
  op: "Shape"
  input: "add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_2/moments/Sub_grad/Shape"
  input: "gradients/bn_2/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_2/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_2/moments/Sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_2/moments/Sub_grad/Sum"
  input: "gradients/bn_2/moments/Sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_2/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_2/moments/Sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_2/moments/Sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_2/moments/Sub_grad/Neg"
  input: "gradients/bn_2/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_2/moments/Sub_grad/Reshape"
  input: "^gradients/bn_2/moments/Sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_2/moments/Sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_2/moments/Sub_grad/Reshape"
  input: "^gradients/bn_2/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/Sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_2/moments/Sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_2/moments/Sub_grad/Reshape_1"
  input: "^gradients/bn_2/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/Sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_14"
  op: "AddN"
  input: "gradients/bn_2/moments/mean_grad/tuple/control_dependency_1"
  input: "gradients/bn_2/moments/SquaredDifference_grad/tuple/control_dependency_1"
  input: "gradients/bn_2/moments/Sub_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_15"
  op: "AddN"
  input: "gradients/bn_2/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/bn_2/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/bn_2/moments/Sub_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_2/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_2_grad/Shape"
  op: "Shape"
  input: "Conv2D_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/add_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_2_grad/Shape"
  input: "gradients/add_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_15"
  input: "gradients/add_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_2_grad/Sum"
  input: "gradients/add_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_15"
  input: "gradients/add_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_2_grad/Sum_1"
  input: "gradients/add_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_2_grad/Reshape"
  input: "^gradients/add_2_grad/Reshape_1"
}
node {
  name: "gradients/add_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_2_grad/Reshape"
  input: "^gradients/add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_2_grad/Reshape_1"
  input: "^gradients/add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/Shape"
  op: "Shape"
  input: "MaxPool_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_2_grad/Shape"
  input: "Variable_4/read"
  input: "gradients/add_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool_1"
  input: "gradients/Conv2D_2_grad/Shape_1"
  input: "gradients/add_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_2_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_2_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_2_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_2_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_2_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_2_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/MaxPool_1_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "Relu_1"
  input: "MaxPool_1"
  input: "gradients/Conv2D_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/Relu_1_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/MaxPool_1_grad/MaxPoolGrad"
  input: "Relu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "bn_1/batchnorm/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/batchnorm/add_1_grad/Shape"
  input: "gradients/bn_1/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/Relu_1_grad/ReluGrad"
  input: "gradients/bn_1/batchnorm/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/add_1_grad/Sum"
  input: "gradients/bn_1/batchnorm/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/Relu_1_grad/ReluGrad"
  input: "gradients/bn_1/batchnorm/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/add_1_grad/Sum_1"
  input: "gradients/bn_1/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/bn_1/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/batchnorm/mul_1_grad/Shape"
  input: "gradients/bn_1/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/bn_1/batchnorm/add_1_grad/tuple/control_dependency"
  input: "bn_1/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/mul_1_grad/mul"
  input: "gradients/bn_1/batchnorm/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/mul_1_grad/Sum"
  input: "gradients/bn_1/batchnorm/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/mul_1"
  op: "Mul"
  input: "add_1"
  input: "gradients/bn_1/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/mul_1_grad/mul_1"
  input: "gradients/bn_1/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/bn_1/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/bn_1/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/batchnorm/sub_grad/Shape"
  input: "gradients/bn_1/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_1/batchnorm/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/sub_grad/Sum"
  input: "gradients/bn_1/batchnorm/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_1/batchnorm/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_1/batchnorm/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/sub_grad/Neg"
  input: "gradients/bn_1/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/sub_grad/Reshape_1"
  input: "^gradients/bn_1/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/batchnorm/mul_2_grad/Shape"
  input: "gradients/bn_1/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/mul"
  op: "Mul"
  input: "gradients/bn_1/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "bn_1/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/mul_2_grad/mul"
  input: "gradients/bn_1/batchnorm/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/mul_2_grad/Sum"
  input: "gradients/bn_1/batchnorm/mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/mul_1"
  op: "Mul"
  input: "bn_1/cond/Merge"
  input: "gradients/bn_1/batchnorm/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/mul_2_grad/mul_1"
  input: "gradients/bn_1/batchnorm/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/mul_2_grad/Sum_1"
  input: "gradients/bn_1/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/mul_2_grad/Reshape_1"
  input: "^gradients/bn_1/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_1/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_1/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/bn_1/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/cond/Merge_grad/cond_grad"
  input: "^gradients/bn_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/cond/Merge_grad/cond_grad:1"
  input: "^gradients/bn_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AddN_16"
  op: "AddN"
  input: "gradients/bn_1/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/bn_1/batchnorm/mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/batchnorm/mul_grad/Shape"
  input: "gradients/bn_1/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/mul"
  op: "Mul"
  input: "gradients/AddN_16"
  input: "bn_1/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/Sum"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/mul_grad/mul"
  input: "gradients/bn_1/batchnorm/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/mul_grad/Sum"
  input: "gradients/bn_1/batchnorm/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/mul_1"
  op: "Mul"
  input: "bn_1/batchnorm/Rsqrt"
  input: "gradients/AddN_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/mul_grad/mul_1"
  input: "gradients/bn_1/batchnorm/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/mul_grad/Sum_1"
  input: "gradients/bn_1/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/mul_grad/Reshape_1"
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/mul_grad/Reshape_1"
  input: "^gradients/bn_1/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "bn_1/batchnorm/Rsqrt"
  input: "gradients/bn_1/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Switch_8"
  op: "Switch"
  input: "bn_1/moments/Squeeze"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_9"
  op: "Shape"
  input: "gradients/Switch_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_8/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_8"
  op: "Fill"
  input: "gradients/Shape_9"
  input: "gradients/zeros_8/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_1/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/zeros_8"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/batchnorm/add_grad/Shape"
  input: "gradients/bn_1/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_1/batchnorm/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/add_grad/Sum"
  input: "gradients/bn_1/batchnorm/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_1/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn_1/batchnorm/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/batchnorm/add_grad/Sum_1"
  input: "gradients/bn_1/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/add_grad/Reshape"
  input: "^gradients/bn_1/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/batchnorm/add_grad/Reshape_1"
  input: "^gradients/bn_1/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Squeeze_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Squeeze_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_1/moments/Squeeze_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/cond/Merge_1_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn_1/batchnorm/add_grad/tuple/control_dependency"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/cond/Merge_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/cond/Merge_1_grad/cond_grad"
}
node {
  name: "gradients/bn_1/cond/Merge_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/cond/Merge_1_grad/cond_grad"
  input: "^gradients/bn_1/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/cond/Merge_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/cond/Merge_1_grad/cond_grad:1"
  input: "^gradients/bn_1/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/mean_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/mean_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/moments/mean_grad/Shape"
  input: "gradients/bn_1/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/mean_grad/Sum"
  op: "Sum"
  input: "gradients/bn_1/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_1/moments/mean_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/moments/mean_grad/Sum"
  input: "gradients/bn_1/moments/mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/mean_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_1/moments/Squeeze_grad/Reshape"
  input: "gradients/bn_1/moments/mean_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/mean_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/moments/mean_grad/Sum_1"
  input: "gradients/bn_1/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/mean_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/moments/mean_grad/Reshape"
  input: "^gradients/bn_1/moments/mean_grad/Reshape_1"
}
node {
  name: "gradients/bn_1/moments/mean_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/moments/mean_grad/Reshape"
  input: "^gradients/bn_1/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/mean_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/moments/mean_grad/Reshape_1"
  input: "^gradients/bn_1/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_9"
  op: "Switch"
  input: "bn_1/moments/Squeeze_1"
  input: "bn_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_10"
  op: "Shape"
  input: "gradients/Switch_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_9/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_9"
  op: "Fill"
  input: "gradients/Shape_10"
  input: "gradients/zeros_9/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn_1/cond/Merge_1_grad/tuple/control_dependency_1"
  input: "gradients/zeros_9"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/Squeeze_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Squeeze_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn_1/moments/Squeeze_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/moments/variance_grad/Shape"
  input: "gradients/bn_1/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/Sum"
  op: "Sum"
  input: "gradients/bn_1/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_1/moments/variance_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/moments/variance_grad/Sum"
  input: "gradients/bn_1/moments/variance_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_1/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn_1/moments/variance_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/Neg"
  op: "Neg"
  input: "gradients/bn_1/moments/variance_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/moments/variance_grad/Neg"
  input: "gradients/bn_1/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/moments/variance_grad/Reshape"
  input: "^gradients/bn_1/moments/variance_grad/Reshape_1"
}
node {
  name: "gradients/bn_1/moments/variance_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/moments/variance_grad/Reshape"
  input: "^gradients/bn_1/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/variance_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/variance_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/moments/variance_grad/Reshape_1"
  input: "^gradients/bn_1/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/variance_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Shape"
  op: "Shape"
  input: "bn_1/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/add"
  op: "Add"
  input: "bn_1/moments/Mean_1/reduction_indices"
  input: "gradients/bn_1/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_1/moments/Mean_1_grad/add"
  input: "gradients/bn_1/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/range"
  op: "Range"
  input: "gradients/bn_1/moments/Mean_1_grad/range/start"
  input: "gradients/bn_1/moments/Mean_1_grad/Size"
  input: "gradients/bn_1/moments/Mean_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Fill"
  op: "Fill"
  input: "gradients/bn_1/moments/Mean_1_grad/Shape_1"
  input: "gradients/bn_1/moments/Mean_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_1/moments/Mean_1_grad/range"
  input: "gradients/bn_1/moments/Mean_1_grad/mod"
  input: "gradients/bn_1/moments/Mean_1_grad/Shape"
  input: "gradients/bn_1/moments/Mean_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_1/moments/Mean_1_grad/DynamicStitch"
  input: "gradients/bn_1/moments/Mean_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_1/moments/Mean_1_grad/Shape"
  input: "gradients/bn_1/moments/Mean_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/moments/variance_grad/tuple/control_dependency"
  input: "gradients/bn_1/moments/Mean_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Tile"
  op: "Tile"
  input: "gradients/bn_1/moments/Mean_1_grad/Reshape"
  input: "gradients/bn_1/moments/Mean_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Shape_2"
  op: "Shape"
  input: "bn_1/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Prod"
  op: "Prod"
  input: "gradients/bn_1/moments/Mean_1_grad/Shape_2"
  input: "gradients/bn_1/moments/Mean_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_1/moments/Mean_1_grad/Shape_3"
  input: "gradients/bn_1/moments/Mean_1_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_1/moments/Mean_1_grad/Prod_1"
  input: "gradients/bn_1/moments/Mean_1_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_1/moments/Mean_1_grad/Prod"
  input: "gradients/bn_1/moments/Mean_1_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/Cast"
  op: "Cast"
  input: "gradients/bn_1/moments/Mean_1_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Mean_1_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_1/moments/Mean_1_grad/Tile"
  input: "gradients/bn_1/moments/Mean_1_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/Square_grad/mul/x"
  op: "Const"
  input: "^gradients/bn_1/moments/variance_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Square_grad/mul"
  op: "Mul"
  input: "gradients/bn_1/moments/Square_grad/mul/x"
  input: "bn_1/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/Square_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_1/moments/variance_grad/tuple/control_dependency_1"
  input: "gradients/bn_1/moments/Square_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/moments/SquaredDifference_grad/Shape"
  input: "gradients/bn_1/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/bn_1/moments/Mean_1_grad/truediv"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/mul"
  op: "Mul"
  input: "gradients/bn_1/moments/SquaredDifference_grad/scalar"
  input: "gradients/bn_1/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "add_1"
  input: "bn_1/moments/StopGradient"
  input: "^gradients/bn_1/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/bn_1/moments/SquaredDifference_grad/mul"
  input: "gradients/bn_1/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/bn_1/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_1/moments/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/moments/SquaredDifference_grad/Sum"
  input: "gradients/bn_1/moments/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_1/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn_1/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/bn_1/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/bn_1/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_1/moments/SquaredDifference_grad/Neg"
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn_1/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/moments/SquaredDifference_grad/Neg"
  input: "^gradients/bn_1/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/AddN_17"
  op: "AddN"
  input: "gradients/bn_1/moments/mean_grad/tuple/control_dependency"
  input: "gradients/bn_1/moments/Square_grad/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Shape"
  op: "Shape"
  input: "bn_1/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/add"
  op: "Add"
  input: "bn_1/moments/shifted_mean/reduction_indices"
  input: "gradients/bn_1/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/mod"
  op: "FloorMod"
  input: "gradients/bn_1/moments/shifted_mean_grad/add"
  input: "gradients/bn_1/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/range"
  op: "Range"
  input: "gradients/bn_1/moments/shifted_mean_grad/range/start"
  input: "gradients/bn_1/moments/shifted_mean_grad/Size"
  input: "gradients/bn_1/moments/shifted_mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Fill"
  op: "Fill"
  input: "gradients/bn_1/moments/shifted_mean_grad/Shape_1"
  input: "gradients/bn_1/moments/shifted_mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn_1/moments/shifted_mean_grad/range"
  input: "gradients/bn_1/moments/shifted_mean_grad/mod"
  input: "gradients/bn_1/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_1/moments/shifted_mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn_1/moments/shifted_mean_grad/DynamicStitch"
  input: "gradients/bn_1/moments/shifted_mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn_1/moments/shifted_mean_grad/Shape"
  input: "gradients/bn_1/moments/shifted_mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN_17"
  input: "gradients/bn_1/moments/shifted_mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Tile"
  op: "Tile"
  input: "gradients/bn_1/moments/shifted_mean_grad/Reshape"
  input: "gradients/bn_1/moments/shifted_mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Shape_2"
  op: "Shape"
  input: "bn_1/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Prod"
  op: "Prod"
  input: "gradients/bn_1/moments/shifted_mean_grad/Shape_2"
  input: "gradients/bn_1/moments/shifted_mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn_1/moments/shifted_mean_grad/Shape_3"
  input: "gradients/bn_1/moments/shifted_mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn_1/moments/shifted_mean_grad/Prod_1"
  input: "gradients/bn_1/moments/shifted_mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn_1/moments/shifted_mean_grad/Prod"
  input: "gradients/bn_1/moments/shifted_mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/Cast"
  op: "Cast"
  input: "gradients/bn_1/moments/shifted_mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/shifted_mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn_1/moments/shifted_mean_grad/Tile"
  input: "gradients/bn_1/moments/shifted_mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/Shape"
  op: "Shape"
  input: "add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn_1/moments/Sub_grad/Shape"
  input: "gradients/bn_1/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn_1/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_1/moments/Sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn_1/moments/Sub_grad/Sum"
  input: "gradients/bn_1/moments/Sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn_1/moments/shifted_mean_grad/truediv"
  input: "gradients/bn_1/moments/Sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn_1/moments/Sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn_1/moments/Sub_grad/Neg"
  input: "gradients/bn_1/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn_1/moments/Sub_grad/Reshape"
  input: "^gradients/bn_1/moments/Sub_grad/Reshape_1"
}
node {
  name: "gradients/bn_1/moments/Sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn_1/moments/Sub_grad/Reshape"
  input: "^gradients/bn_1/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/Sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn_1/moments/Sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn_1/moments/Sub_grad/Reshape_1"
  input: "^gradients/bn_1/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/Sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_18"
  op: "AddN"
  input: "gradients/bn_1/moments/mean_grad/tuple/control_dependency_1"
  input: "gradients/bn_1/moments/SquaredDifference_grad/tuple/control_dependency_1"
  input: "gradients/bn_1/moments/Sub_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_19"
  op: "AddN"
  input: "gradients/bn_1/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/bn_1/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/bn_1/moments/Sub_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn_1/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_1_grad/Shape"
  op: "Shape"
  input: "Conv2D_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "gradients/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_1_grad/Shape"
  input: "gradients/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_19"
  input: "gradients/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_1_grad/Sum"
  input: "gradients/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_19"
  input: "gradients/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_1_grad/Sum_1"
  input: "gradients/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_1_grad/Reshape"
  input: "^gradients/add_1_grad/Reshape_1"
}
node {
  name: "gradients/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_1_grad/Reshape"
  input: "^gradients/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_1_grad/Reshape_1"
  input: "^gradients/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/Shape"
  op: "Shape"
  input: "MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_1_grad/Shape"
  input: "Variable_2/read"
  input: "gradients/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\010\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool"
  input: "gradients/Conv2D_1_grad/Shape_1"
  input: "gradients/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_1_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_1_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_1_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_1_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_1_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_1_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "Relu"
  input: "MaxPool"
  input: "gradients/Conv2D_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/MaxPool_grad/MaxPoolGrad"
  input: "Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "bn/batchnorm/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/batchnorm/add_1_grad/Shape"
  input: "gradients/bn/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/Relu_grad/ReluGrad"
  input: "gradients/bn/batchnorm/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/batchnorm/add_1_grad/Sum"
  input: "gradients/bn/batchnorm/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/Relu_grad/ReluGrad"
  input: "gradients/bn/batchnorm/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/batchnorm/add_1_grad/Sum_1"
  input: "gradients/bn/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/batchnorm/add_1_grad/Reshape"
  input: "^gradients/bn/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/bn/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/batchnorm/mul_1_grad/Shape"
  input: "gradients/bn/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/bn/batchnorm/add_1_grad/tuple/control_dependency"
  input: "bn/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/bn/batchnorm/mul_1_grad/mul"
  input: "gradients/bn/batchnorm/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/batchnorm/mul_1_grad/Sum"
  input: "gradients/bn/batchnorm/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/mul_1"
  op: "Mul"
  input: "add"
  input: "gradients/bn/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn/batchnorm/mul_1_grad/mul_1"
  input: "gradients/bn/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/bn/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/bn/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/bn/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/batchnorm/sub_grad/Shape"
  input: "gradients/bn/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn/batchnorm/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/batchnorm/sub_grad/Sum"
  input: "gradients/bn/batchnorm/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/bn/batchnorm/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn/batchnorm/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/batchnorm/sub_grad/Neg"
  input: "gradients/bn/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn/batchnorm/sub_grad/Reshape_1"
}
node {
  name: "gradients/bn/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/batchnorm/sub_grad/Reshape"
  input: "^gradients/bn/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/batchnorm/sub_grad/Reshape_1"
  input: "^gradients/bn/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/batchnorm/mul_2_grad/Shape"
  input: "gradients/bn/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/mul"
  op: "Mul"
  input: "gradients/bn/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "bn/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/bn/batchnorm/mul_2_grad/mul"
  input: "gradients/bn/batchnorm/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/batchnorm/mul_2_grad/Sum"
  input: "gradients/bn/batchnorm/mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/mul_1"
  op: "Mul"
  input: "bn/cond/Merge"
  input: "gradients/bn/batchnorm/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn/batchnorm/mul_2_grad/mul_1"
  input: "gradients/bn/batchnorm/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/batchnorm/mul_2_grad/Sum_1"
  input: "gradients/bn/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn/batchnorm/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/bn/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/batchnorm/mul_2_grad/Reshape_1"
  input: "^gradients/bn/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/bn/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/cond/Merge_grad/cond_grad"
  input: "^gradients/bn/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/cond/Merge_grad/cond_grad:1"
  input: "^gradients/bn/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AddN_20"
  op: "AddN"
  input: "gradients/bn/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/bn/batchnorm/mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/batchnorm/mul_grad/Shape"
  input: "gradients/bn/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/mul"
  op: "Mul"
  input: "gradients/AddN_20"
  input: "bn/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/Sum"
  op: "Sum"
  input: "gradients/bn/batchnorm/mul_grad/mul"
  input: "gradients/bn/batchnorm/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/batchnorm/mul_grad/Sum"
  input: "gradients/bn/batchnorm/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/mul_1"
  op: "Mul"
  input: "bn/batchnorm/Rsqrt"
  input: "gradients/AddN_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn/batchnorm/mul_grad/mul_1"
  input: "gradients/bn/batchnorm/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/batchnorm/mul_grad/Sum_1"
  input: "gradients/bn/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn/batchnorm/mul_grad/Reshape_1"
}
node {
  name: "gradients/bn/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/batchnorm/mul_grad/Reshape"
  input: "^gradients/bn/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/batchnorm/mul_grad/Reshape_1"
  input: "^gradients/bn/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "bn/batchnorm/Rsqrt"
  input: "gradients/bn/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Switch_10"
  op: "Switch"
  input: "bn/moments/Squeeze"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_11"
  op: "Shape"
  input: "gradients/Switch_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_10/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_10"
  op: "Fill"
  input: "gradients/Shape_11"
  input: "gradients/zeros_10/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/zeros_10"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/batchnorm/add_grad/Shape"
  input: "gradients/bn/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/bn/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn/batchnorm/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/batchnorm/add_grad/Sum"
  input: "gradients/bn/batchnorm/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/bn/batchnorm/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/batchnorm/add_grad/Sum_1"
  input: "gradients/bn/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/batchnorm/add_grad/Reshape"
  input: "^gradients/bn/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/bn/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/batchnorm/add_grad/Reshape"
  input: "^gradients/bn/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/batchnorm/add_grad/Reshape_1"
  input: "^gradients/bn/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Squeeze_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Squeeze_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/cond/ExponentialMovingAverage/AssignMovingAvg/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn/moments/Squeeze_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/cond/Merge_1_grad/cond_grad"
  op: "Switch"
  input: "gradients/bn/batchnorm/add_grad/tuple/control_dependency"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/cond/Merge_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/cond/Merge_1_grad/cond_grad"
}
node {
  name: "gradients/bn/cond/Merge_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/cond/Merge_1_grad/cond_grad"
  input: "^gradients/bn/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/cond/Merge_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/cond/Merge_1_grad/cond_grad:1"
  input: "^gradients/bn/cond/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/mean_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/mean_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/moments/mean_grad/Shape"
  input: "gradients/bn/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/mean_grad/Sum"
  op: "Sum"
  input: "gradients/bn/moments/Squeeze_grad/Reshape"
  input: "gradients/bn/moments/mean_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/moments/mean_grad/Sum"
  input: "gradients/bn/moments/mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/mean_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn/moments/Squeeze_grad/Reshape"
  input: "gradients/bn/moments/mean_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/mean_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/moments/mean_grad/Sum_1"
  input: "gradients/bn/moments/mean_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/mean_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/moments/mean_grad/Reshape"
  input: "^gradients/bn/moments/mean_grad/Reshape_1"
}
node {
  name: "gradients/bn/moments/mean_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/moments/mean_grad/Reshape"
  input: "^gradients/bn/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/mean_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/moments/mean_grad/Reshape_1"
  input: "^gradients/bn/moments/mean_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_11"
  op: "Switch"
  input: "bn/moments/Squeeze_1"
  input: "bn/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_12"
  op: "Shape"
  input: "gradients/Switch_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_11/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_11"
  op: "Fill"
  input: "gradients/Shape_12"
  input: "gradients/zeros_11/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/bn/cond/Merge_1_grad/tuple/control_dependency_1"
  input: "gradients/zeros_11"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/Squeeze_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Squeeze_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/cond/ExponentialMovingAverage/AssignMovingAvg_1/sub_1/Switch_1_grad/cond_grad"
  input: "gradients/bn/moments/Squeeze_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/moments/variance_grad/Shape"
  input: "gradients/bn/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/Sum"
  op: "Sum"
  input: "gradients/bn/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn/moments/variance_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/moments/variance_grad/Sum"
  input: "gradients/bn/moments/variance_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn/moments/Squeeze_1_grad/Reshape"
  input: "gradients/bn/moments/variance_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/Neg"
  op: "Neg"
  input: "gradients/bn/moments/variance_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/moments/variance_grad/Neg"
  input: "gradients/bn/moments/variance_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/moments/variance_grad/Reshape"
  input: "^gradients/bn/moments/variance_grad/Reshape_1"
}
node {
  name: "gradients/bn/moments/variance_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/moments/variance_grad/Reshape"
  input: "^gradients/bn/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/variance_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/variance_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/moments/variance_grad/Reshape_1"
  input: "^gradients/bn/moments/variance_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/variance_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Shape"
  op: "Shape"
  input: "bn/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/add"
  op: "Add"
  input: "bn/moments/Mean_1/reduction_indices"
  input: "gradients/bn/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/mod"
  op: "FloorMod"
  input: "gradients/bn/moments/Mean_1_grad/add"
  input: "gradients/bn/moments/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/range"
  op: "Range"
  input: "gradients/bn/moments/Mean_1_grad/range/start"
  input: "gradients/bn/moments/Mean_1_grad/Size"
  input: "gradients/bn/moments/Mean_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Fill"
  op: "Fill"
  input: "gradients/bn/moments/Mean_1_grad/Shape_1"
  input: "gradients/bn/moments/Mean_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn/moments/Mean_1_grad/range"
  input: "gradients/bn/moments/Mean_1_grad/mod"
  input: "gradients/bn/moments/Mean_1_grad/Shape"
  input: "gradients/bn/moments/Mean_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn/moments/Mean_1_grad/DynamicStitch"
  input: "gradients/bn/moments/Mean_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn/moments/Mean_1_grad/Shape"
  input: "gradients/bn/moments/Mean_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/moments/variance_grad/tuple/control_dependency"
  input: "gradients/bn/moments/Mean_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Tile"
  op: "Tile"
  input: "gradients/bn/moments/Mean_1_grad/Reshape"
  input: "gradients/bn/moments/Mean_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Shape_2"
  op: "Shape"
  input: "bn/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Prod"
  op: "Prod"
  input: "gradients/bn/moments/Mean_1_grad/Shape_2"
  input: "gradients/bn/moments/Mean_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn/moments/Mean_1_grad/Shape_3"
  input: "gradients/bn/moments/Mean_1_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn/moments/Mean_1_grad/Prod_1"
  input: "gradients/bn/moments/Mean_1_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn/moments/Mean_1_grad/Prod"
  input: "gradients/bn/moments/Mean_1_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/Cast"
  op: "Cast"
  input: "gradients/bn/moments/Mean_1_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Mean_1_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn/moments/Mean_1_grad/Tile"
  input: "gradients/bn/moments/Mean_1_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/Square_grad/mul/x"
  op: "Const"
  input: "^gradients/bn/moments/variance_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Square_grad/mul"
  op: "Mul"
  input: "gradients/bn/moments/Square_grad/mul/x"
  input: "bn/moments/shifted_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/Square_grad/mul_1"
  op: "Mul"
  input: "gradients/bn/moments/variance_grad/tuple/control_dependency_1"
  input: "gradients/bn/moments/Square_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/moments/SquaredDifference_grad/Shape"
  input: "gradients/bn/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/bn/moments/Mean_1_grad/truediv"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/mul"
  op: "Mul"
  input: "gradients/bn/moments/SquaredDifference_grad/scalar"
  input: "gradients/bn/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "add"
  input: "bn/moments/StopGradient"
  input: "^gradients/bn/moments/Mean_1_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/bn/moments/SquaredDifference_grad/mul"
  input: "gradients/bn/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/bn/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn/moments/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/moments/SquaredDifference_grad/Sum"
  input: "gradients/bn/moments/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn/moments/SquaredDifference_grad/mul_1"
  input: "gradients/bn/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/bn/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/bn/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn/moments/SquaredDifference_grad/Neg"
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/bn/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/moments/SquaredDifference_grad/Neg"
  input: "^gradients/bn/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/AddN_21"
  op: "AddN"
  input: "gradients/bn/moments/mean_grad/tuple/control_dependency"
  input: "gradients/bn/moments/Square_grad/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/mean_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Shape"
  op: "Shape"
  input: "bn/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/add"
  op: "Add"
  input: "bn/moments/shifted_mean/reduction_indices"
  input: "gradients/bn/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/mod"
  op: "FloorMod"
  input: "gradients/bn/moments/shifted_mean_grad/add"
  input: "gradients/bn/moments/shifted_mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/range"
  op: "Range"
  input: "gradients/bn/moments/shifted_mean_grad/range/start"
  input: "gradients/bn/moments/shifted_mean_grad/Size"
  input: "gradients/bn/moments/shifted_mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Fill"
  op: "Fill"
  input: "gradients/bn/moments/shifted_mean_grad/Shape_1"
  input: "gradients/bn/moments/shifted_mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/bn/moments/shifted_mean_grad/range"
  input: "gradients/bn/moments/shifted_mean_grad/mod"
  input: "gradients/bn/moments/shifted_mean_grad/Shape"
  input: "gradients/bn/moments/shifted_mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/bn/moments/shifted_mean_grad/DynamicStitch"
  input: "gradients/bn/moments/shifted_mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/bn/moments/shifted_mean_grad/Shape"
  input: "gradients/bn/moments/shifted_mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN_21"
  input: "gradients/bn/moments/shifted_mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Tile"
  op: "Tile"
  input: "gradients/bn/moments/shifted_mean_grad/Reshape"
  input: "gradients/bn/moments/shifted_mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Shape_2"
  op: "Shape"
  input: "bn/moments/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Shape_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Prod"
  op: "Prod"
  input: "gradients/bn/moments/shifted_mean_grad/Shape_2"
  input: "gradients/bn/moments/shifted_mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/bn/moments/shifted_mean_grad/Shape_3"
  input: "gradients/bn/moments/shifted_mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/bn/moments/shifted_mean_grad/Prod_1"
  input: "gradients/bn/moments/shifted_mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/bn/moments/shifted_mean_grad/Prod"
  input: "gradients/bn/moments/shifted_mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/Cast"
  op: "Cast"
  input: "gradients/bn/moments/shifted_mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/shifted_mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/bn/moments/shifted_mean_grad/Tile"
  input: "gradients/bn/moments/shifted_mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/Shape"
  op: "Shape"
  input: "add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/bn/moments/Sub_grad/Shape"
  input: "gradients/bn/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/Sum"
  op: "Sum"
  input: "gradients/bn/moments/shifted_mean_grad/truediv"
  input: "gradients/bn/moments/Sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/bn/moments/Sub_grad/Sum"
  input: "gradients/bn/moments/Sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/bn/moments/shifted_mean_grad/truediv"
  input: "gradients/bn/moments/Sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/Neg"
  op: "Neg"
  input: "gradients/bn/moments/Sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/bn/moments/Sub_grad/Neg"
  input: "gradients/bn/moments/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/bn/moments/Sub_grad/Reshape"
  input: "^gradients/bn/moments/Sub_grad/Reshape_1"
}
node {
  name: "gradients/bn/moments/Sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/bn/moments/Sub_grad/Reshape"
  input: "^gradients/bn/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/Sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/bn/moments/Sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/bn/moments/Sub_grad/Reshape_1"
  input: "^gradients/bn/moments/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/Sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_22"
  op: "AddN"
  input: "gradients/bn/moments/mean_grad/tuple/control_dependency_1"
  input: "gradients/bn/moments/SquaredDifference_grad/tuple/control_dependency_1"
  input: "gradients/bn/moments/Sub_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/moments/mean_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_23"
  op: "AddN"
  input: "gradients/bn/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/bn/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/bn/moments/Sub_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/bn/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_grad/Shape"
  op: "Shape"
  input: "Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_grad/Shape"
  input: "gradients/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_23"
  input: "gradients/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_grad/Sum"
  input: "gradients/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_23"
  input: "gradients/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_grad/Sum_1"
  input: "gradients/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_grad/Reshape"
  input: "^gradients/add_grad/Reshape_1"
}
node {
  name: "gradients/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_grad/Reshape"
  input: "^gradients/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_grad/Reshape_1"
  input: "^gradients/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_grad/Shape"
  op: "Shape"
  input: "input_image"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_grad/Shape"
  input: "Variable/read"
  input: "gradients/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "input_image"
  input: "gradients/Conv2D_grad/Shape_1"
  input: "gradients/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "clip_by_value/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value/Minimum"
  op: "Minimum"
  input: "gradients/Conv2D_grad/tuple/control_dependency_1"
  input: "clip_by_value/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value"
  op: "Maximum"
  input: "clip_by_value/Minimum"
  input: "clip_by_value/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_1/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_1/Minimum"
  op: "Minimum"
  input: "gradients/add_grad/tuple/control_dependency_1"
  input: "clip_by_value_1/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_1"
  op: "Maximum"
  input: "clip_by_value_1/Minimum"
  input: "clip_by_value_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_2/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_2/Minimum"
  op: "Minimum"
  input: "gradients/bn/batchnorm/sub_grad/tuple/control_dependency"
  input: "clip_by_value_2/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_2"
  op: "Maximum"
  input: "clip_by_value_2/Minimum"
  input: "clip_by_value_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_3/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_3/Minimum"
  op: "Minimum"
  input: "gradients/bn/batchnorm/mul_grad/tuple/control_dependency_1"
  input: "clip_by_value_3/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_3/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_3"
  op: "Maximum"
  input: "clip_by_value_3/Minimum"
  input: "clip_by_value_3/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_4/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_4/Minimum"
  op: "Minimum"
  input: "gradients/Conv2D_1_grad/tuple/control_dependency_1"
  input: "clip_by_value_4/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_4/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_4"
  op: "Maximum"
  input: "clip_by_value_4/Minimum"
  input: "clip_by_value_4/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_5/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_5/Minimum"
  op: "Minimum"
  input: "gradients/add_1_grad/tuple/control_dependency_1"
  input: "clip_by_value_5/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_5/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_5"
  op: "Maximum"
  input: "clip_by_value_5/Minimum"
  input: "clip_by_value_5/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_6/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_6/Minimum"
  op: "Minimum"
  input: "gradients/bn_1/batchnorm/sub_grad/tuple/control_dependency"
  input: "clip_by_value_6/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_6/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_6"
  op: "Maximum"
  input: "clip_by_value_6/Minimum"
  input: "clip_by_value_6/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_7/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_7/Minimum"
  op: "Minimum"
  input: "gradients/bn_1/batchnorm/mul_grad/tuple/control_dependency_1"
  input: "clip_by_value_7/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_7/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_7"
  op: "Maximum"
  input: "clip_by_value_7/Minimum"
  input: "clip_by_value_7/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_8/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_8/Minimum"
  op: "Minimum"
  input: "gradients/Conv2D_2_grad/tuple/control_dependency_1"
  input: "clip_by_value_8/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_8/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_8"
  op: "Maximum"
  input: "clip_by_value_8/Minimum"
  input: "clip_by_value_8/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_9/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_9/Minimum"
  op: "Minimum"
  input: "gradients/add_2_grad/tuple/control_dependency_1"
  input: "clip_by_value_9/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_9/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_9"
  op: "Maximum"
  input: "clip_by_value_9/Minimum"
  input: "clip_by_value_9/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_10/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_10/Minimum"
  op: "Minimum"
  input: "gradients/bn_2/batchnorm/sub_grad/tuple/control_dependency"
  input: "clip_by_value_10/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_10/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_10"
  op: "Maximum"
  input: "clip_by_value_10/Minimum"
  input: "clip_by_value_10/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_11/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_11/Minimum"
  op: "Minimum"
  input: "gradients/bn_2/batchnorm/mul_grad/tuple/control_dependency_1"
  input: "clip_by_value_11/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_11/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_11"
  op: "Maximum"
  input: "clip_by_value_11/Minimum"
  input: "clip_by_value_11/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_12/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_12/Minimum"
  op: "Minimum"
  input: "gradients/Conv2D_3_grad/tuple/control_dependency_1"
  input: "clip_by_value_12/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_12/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_12"
  op: "Maximum"
  input: "clip_by_value_12/Minimum"
  input: "clip_by_value_12/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_13/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_13/Minimum"
  op: "Minimum"
  input: "gradients/add_3_grad/tuple/control_dependency_1"
  input: "clip_by_value_13/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_13/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_13"
  op: "Maximum"
  input: "clip_by_value_13/Minimum"
  input: "clip_by_value_13/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_14/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_14/Minimum"
  op: "Minimum"
  input: "gradients/bn_3/batchnorm/sub_grad/tuple/control_dependency"
  input: "clip_by_value_14/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_14/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_14"
  op: "Maximum"
  input: "clip_by_value_14/Minimum"
  input: "clip_by_value_14/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_15/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_15/Minimum"
  op: "Minimum"
  input: "gradients/bn_3/batchnorm/mul_grad/tuple/control_dependency_1"
  input: "clip_by_value_15/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_15/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_15"
  op: "Maximum"
  input: "clip_by_value_15/Minimum"
  input: "clip_by_value_15/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_16/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_16/Minimum"
  op: "Minimum"
  input: "gradients/Conv2D_4_grad/tuple/control_dependency_1"
  input: "clip_by_value_16/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_16/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_16"
  op: "Maximum"
  input: "clip_by_value_16/Minimum"
  input: "clip_by_value_16/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_17/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_17/Minimum"
  op: "Minimum"
  input: "gradients/add_4_grad/tuple/control_dependency_1"
  input: "clip_by_value_17/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_17/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_17"
  op: "Maximum"
  input: "clip_by_value_17/Minimum"
  input: "clip_by_value_17/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_18/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_18/Minimum"
  op: "Minimum"
  input: "gradients/bn_4/batchnorm/sub_grad/tuple/control_dependency"
  input: "clip_by_value_18/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_18/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_18"
  op: "Maximum"
  input: "clip_by_value_18/Minimum"
  input: "clip_by_value_18/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_19/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_19/Minimum"
  op: "Minimum"
  input: "gradients/bn_4/batchnorm/mul_grad/tuple/control_dependency_1"
  input: "clip_by_value_19/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_19/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_19"
  op: "Maximum"
  input: "clip_by_value_19/Minimum"
  input: "clip_by_value_19/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_20/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_20/Minimum"
  op: "Minimum"
  input: "gradients/Conv2D_5_grad/tuple/control_dependency_1"
  input: "clip_by_value_20/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_20/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_20"
  op: "Maximum"
  input: "clip_by_value_20/Minimum"
  input: "clip_by_value_20/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_21/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_21/Minimum"
  op: "Minimum"
  input: "gradients/add_5_grad/tuple/control_dependency_1"
  input: "clip_by_value_21/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_21/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_21"
  op: "Maximum"
  input: "clip_by_value_21/Minimum"
  input: "clip_by_value_21/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_22/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_22/Minimum"
  op: "Minimum"
  input: "gradients/bn_5/batchnorm/sub_grad/tuple/control_dependency"
  input: "clip_by_value_22/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_22/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_22"
  op: "Maximum"
  input: "clip_by_value_22/Minimum"
  input: "clip_by_value_22/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_23/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_23/Minimum"
  op: "Minimum"
  input: "gradients/bn_5/batchnorm/mul_grad/tuple/control_dependency_1"
  input: "clip_by_value_23/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_23/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_23"
  op: "Maximum"
  input: "clip_by_value_23/Minimum"
  input: "clip_by_value_23/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_24/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_24/Minimum"
  op: "Minimum"
  input: "gradients/MatMul_grad/tuple/control_dependency_1"
  input: "clip_by_value_24/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_24/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_24"
  op: "Maximum"
  input: "clip_by_value_24/Minimum"
  input: "clip_by_value_24/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_25/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_value_25/Minimum"
  op: "Minimum"
  input: "gradients/Add_grad/tuple/control_dependency_1"
  input: "clip_by_value_25/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_value_25/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "clip_by_value_25"
  op: "Maximum"
  input: "clip_by_value_25/Minimum"
  input: "clip_by_value_25/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "beta1_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "beta1_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta1_power/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "beta1_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta1_power/read"
  op: "Identity"
  input: "beta1_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "beta2_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "beta2_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta2_power/Assign"
  op: "Assign"
  input: "beta2_power"
  input: "beta2_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta2_power/read"
  op: "Identity"
  input: "beta2_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Variable/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Adam/Assign"
  op: "Assign"
  input: "Variable/Adam"
  input: "Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/Adam/read"
  op: "Identity"
  input: "Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Variable/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Adam_1/Assign"
  op: "Assign"
  input: "Variable/Adam_1"
  input: "Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/Adam_1/read"
  op: "Identity"
  input: "Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Variable_1/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Adam/Assign"
  op: "Assign"
  input: "Variable_1/Adam"
  input: "Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/Adam/read"
  op: "Identity"
  input: "Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "Variable_1/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "Variable_1/Adam_1"
  input: "Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/Adam_1/read"
  op: "Identity"
  input: "Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "bn/Variable/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/Variable/Adam/Assign"
  op: "Assign"
  input: "bn/Variable/Adam"
  input: "bn/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/Variable/Adam/read"
  op: "Identity"
  input: "bn/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
}
node {
  name: "bn/Variable/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/Variable/Adam_1/Assign"
  op: "Assign"
  input: "bn/Variable/Adam_1"
  input: "bn/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/Variable/Adam_1/read"
  op: "Identity"
  input: "bn/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
}
node {
  name: "bn/Variable_1/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/Variable_1/Adam/Assign"
  op: "Assign"
  input: "bn/Variable_1/Adam"
  input: "bn/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/Variable_1/Adam/read"
  op: "Identity"
  input: "bn/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
}
node {
  name: "bn/Variable_1/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "bn/Variable_1/Adam_1"
  input: "bn/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn/Variable_1/Adam_1/read"
  op: "Identity"
  input: "bn/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
}
node {
  name: "Variable_2/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_2/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_2/Adam/Assign"
  op: "Assign"
  input: "Variable_2/Adam"
  input: "Variable_2/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_2/Adam/read"
  op: "Identity"
  input: "Variable_2/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
}
node {
  name: "Variable_2/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_2/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_2/Adam_1/Assign"
  op: "Assign"
  input: "Variable_2/Adam_1"
  input: "Variable_2/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_2/Adam_1/read"
  op: "Identity"
  input: "Variable_2/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
}
node {
  name: "Variable_3/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_3/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_3/Adam/Assign"
  op: "Assign"
  input: "Variable_3/Adam"
  input: "Variable_3/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_3/Adam/read"
  op: "Identity"
  input: "Variable_3/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
}
node {
  name: "Variable_3/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_3/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_3/Adam_1/Assign"
  op: "Assign"
  input: "Variable_3/Adam_1"
  input: "Variable_3/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_3/Adam_1/read"
  op: "Identity"
  input: "Variable_3/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
}
node {
  name: "bn_1/Variable/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_1/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_1/Variable/Adam/Assign"
  op: "Assign"
  input: "bn_1/Variable/Adam"
  input: "bn_1/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_1/Variable/Adam/read"
  op: "Identity"
  input: "bn_1/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
}
node {
  name: "bn_1/Variable/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_1/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_1/Variable/Adam_1/Assign"
  op: "Assign"
  input: "bn_1/Variable/Adam_1"
  input: "bn_1/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_1/Variable/Adam_1/read"
  op: "Identity"
  input: "bn_1/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
}
node {
  name: "bn_1/Variable_1/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_1/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_1/Variable_1/Adam/Assign"
  op: "Assign"
  input: "bn_1/Variable_1/Adam"
  input: "bn_1/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_1/Variable_1/Adam/read"
  op: "Identity"
  input: "bn_1/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
}
node {
  name: "bn_1/Variable_1/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_1/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_1/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "bn_1/Variable_1/Adam_1"
  input: "bn_1/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_1/Variable_1/Adam_1/read"
  op: "Identity"
  input: "bn_1/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
}
node {
  name: "Variable_4/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 10
          }
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_4/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_4/Adam/Assign"
  op: "Assign"
  input: "Variable_4/Adam"
  input: "Variable_4/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_4/Adam/read"
  op: "Identity"
  input: "Variable_4/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
}
node {
  name: "Variable_4/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 10
          }
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_4/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_4/Adam_1/Assign"
  op: "Assign"
  input: "Variable_4/Adam_1"
  input: "Variable_4/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_4/Adam_1/read"
  op: "Identity"
  input: "Variable_4/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
}
node {
  name: "Variable_5/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_5/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_5/Adam/Assign"
  op: "Assign"
  input: "Variable_5/Adam"
  input: "Variable_5/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_5/Adam/read"
  op: "Identity"
  input: "Variable_5/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
}
node {
  name: "Variable_5/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_5/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_5/Adam_1/Assign"
  op: "Assign"
  input: "Variable_5/Adam_1"
  input: "Variable_5/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_5/Adam_1/read"
  op: "Identity"
  input: "Variable_5/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
}
node {
  name: "bn_2/Variable/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_2/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_2/Variable/Adam/Assign"
  op: "Assign"
  input: "bn_2/Variable/Adam"
  input: "bn_2/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_2/Variable/Adam/read"
  op: "Identity"
  input: "bn_2/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
}
node {
  name: "bn_2/Variable/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_2/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_2/Variable/Adam_1/Assign"
  op: "Assign"
  input: "bn_2/Variable/Adam_1"
  input: "bn_2/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_2/Variable/Adam_1/read"
  op: "Identity"
  input: "bn_2/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
}
node {
  name: "bn_2/Variable_1/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_2/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_2/Variable_1/Adam/Assign"
  op: "Assign"
  input: "bn_2/Variable_1/Adam"
  input: "bn_2/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_2/Variable_1/Adam/read"
  op: "Identity"
  input: "bn_2/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
}
node {
  name: "bn_2/Variable_1/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_2/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_2/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "bn_2/Variable_1/Adam_1"
  input: "bn_2/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_2/Variable_1/Adam_1/read"
  op: "Identity"
  input: "bn_2/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
}
node {
  name: "Variable_6/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 10
          }
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_6/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_6/Adam/Assign"
  op: "Assign"
  input: "Variable_6/Adam"
  input: "Variable_6/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_6/Adam/read"
  op: "Identity"
  input: "Variable_6/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
}
node {
  name: "Variable_6/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 10
          }
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_6/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_6/Adam_1/Assign"
  op: "Assign"
  input: "Variable_6/Adam_1"
  input: "Variable_6/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_6/Adam_1/read"
  op: "Identity"
  input: "Variable_6/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
}
node {
  name: "Variable_7/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_7/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_7/Adam/Assign"
  op: "Assign"
  input: "Variable_7/Adam"
  input: "Variable_7/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_7/Adam/read"
  op: "Identity"
  input: "Variable_7/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
}
node {
  name: "Variable_7/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_7/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_7/Adam_1/Assign"
  op: "Assign"
  input: "Variable_7/Adam_1"
  input: "Variable_7/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_7/Adam_1/read"
  op: "Identity"
  input: "Variable_7/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
}
node {
  name: "bn_3/Variable/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_3/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_3/Variable/Adam/Assign"
  op: "Assign"
  input: "bn_3/Variable/Adam"
  input: "bn_3/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_3/Variable/Adam/read"
  op: "Identity"
  input: "bn_3/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
}
node {
  name: "bn_3/Variable/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_3/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_3/Variable/Adam_1/Assign"
  op: "Assign"
  input: "bn_3/Variable/Adam_1"
  input: "bn_3/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_3/Variable/Adam_1/read"
  op: "Identity"
  input: "bn_3/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
}
node {
  name: "bn_3/Variable_1/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_3/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_3/Variable_1/Adam/Assign"
  op: "Assign"
  input: "bn_3/Variable_1/Adam"
  input: "bn_3/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_3/Variable_1/Adam/read"
  op: "Identity"
  input: "bn_3/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
}
node {
  name: "bn_3/Variable_1/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_3/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_3/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "bn_3/Variable_1/Adam_1"
  input: "bn_3/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_3/Variable_1/Adam_1/read"
  op: "Identity"
  input: "bn_3/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
}
node {
  name: "Variable_8/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 20
          }
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_8/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_8/Adam/Assign"
  op: "Assign"
  input: "Variable_8/Adam"
  input: "Variable_8/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_8/Adam/read"
  op: "Identity"
  input: "Variable_8/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
}
node {
  name: "Variable_8/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 20
          }
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_8/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_8/Adam_1/Assign"
  op: "Assign"
  input: "Variable_8/Adam_1"
  input: "Variable_8/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_8/Adam_1/read"
  op: "Identity"
  input: "Variable_8/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
}
node {
  name: "Variable_9/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_9/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_9/Adam/Assign"
  op: "Assign"
  input: "Variable_9/Adam"
  input: "Variable_9/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_9/Adam/read"
  op: "Identity"
  input: "Variable_9/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
}
node {
  name: "Variable_9/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_9/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_9/Adam_1/Assign"
  op: "Assign"
  input: "Variable_9/Adam_1"
  input: "Variable_9/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_9/Adam_1/read"
  op: "Identity"
  input: "Variable_9/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
}
node {
  name: "bn_4/Variable/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_4/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_4/Variable/Adam/Assign"
  op: "Assign"
  input: "bn_4/Variable/Adam"
  input: "bn_4/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_4/Variable/Adam/read"
  op: "Identity"
  input: "bn_4/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
}
node {
  name: "bn_4/Variable/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_4/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_4/Variable/Adam_1/Assign"
  op: "Assign"
  input: "bn_4/Variable/Adam_1"
  input: "bn_4/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_4/Variable/Adam_1/read"
  op: "Identity"
  input: "bn_4/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
}
node {
  name: "bn_4/Variable_1/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_4/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_4/Variable_1/Adam/Assign"
  op: "Assign"
  input: "bn_4/Variable_1/Adam"
  input: "bn_4/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_4/Variable_1/Adam/read"
  op: "Identity"
  input: "bn_4/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
}
node {
  name: "bn_4/Variable_1/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_4/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_4/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "bn_4/Variable_1/Adam_1"
  input: "bn_4/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_4/Variable_1/Adam_1/read"
  op: "Identity"
  input: "bn_4/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
}
node {
  name: "Variable_10/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 20
          }
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_10/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_10/Adam/Assign"
  op: "Assign"
  input: "Variable_10/Adam"
  input: "Variable_10/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_10/Adam/read"
  op: "Identity"
  input: "Variable_10/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
}
node {
  name: "Variable_10/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 20
          }
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_10/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_10/Adam_1/Assign"
  op: "Assign"
  input: "Variable_10/Adam_1"
  input: "Variable_10/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_10/Adam_1/read"
  op: "Identity"
  input: "Variable_10/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
}
node {
  name: "Variable_11/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_11/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_11/Adam/Assign"
  op: "Assign"
  input: "Variable_11/Adam"
  input: "Variable_11/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_11/Adam/read"
  op: "Identity"
  input: "Variable_11/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
}
node {
  name: "Variable_11/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_11/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_11/Adam_1/Assign"
  op: "Assign"
  input: "Variable_11/Adam_1"
  input: "Variable_11/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_11/Adam_1/read"
  op: "Identity"
  input: "Variable_11/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
}
node {
  name: "bn_5/Variable/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_5/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_5/Variable/Adam/Assign"
  op: "Assign"
  input: "bn_5/Variable/Adam"
  input: "bn_5/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_5/Variable/Adam/read"
  op: "Identity"
  input: "bn_5/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
}
node {
  name: "bn_5/Variable/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_5/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_5/Variable/Adam_1/Assign"
  op: "Assign"
  input: "bn_5/Variable/Adam_1"
  input: "bn_5/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_5/Variable/Adam_1/read"
  op: "Identity"
  input: "bn_5/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
}
node {
  name: "bn_5/Variable_1/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_5/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_5/Variable_1/Adam/Assign"
  op: "Assign"
  input: "bn_5/Variable_1/Adam"
  input: "bn_5/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_5/Variable_1/Adam/read"
  op: "Identity"
  input: "bn_5/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
}
node {
  name: "bn_5/Variable_1/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "bn_5/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bn_5/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "bn_5/Variable_1/Adam_1"
  input: "bn_5/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bn_5/Variable_1/Adam_1/read"
  op: "Identity"
  input: "bn_5/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
}
node {
  name: "Variable_12/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_12/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_12/Adam/Assign"
  op: "Assign"
  input: "Variable_12/Adam"
  input: "Variable_12/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_12/Adam/read"
  op: "Identity"
  input: "Variable_12/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
}
node {
  name: "Variable_12/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 20
          }
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_12/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_12/Adam_1/Assign"
  op: "Assign"
  input: "Variable_12/Adam_1"
  input: "Variable_12/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_12/Adam_1/read"
  op: "Identity"
  input: "Variable_12/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
}
node {
  name: "Variable_13/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_13/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_13/Adam/Assign"
  op: "Assign"
  input: "Variable_13/Adam"
  input: "Variable_13/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_13/Adam/read"
  op: "Identity"
  input: "Variable_13/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
}
node {
  name: "Variable_13/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_13/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_13/Adam_1/Assign"
  op: "Assign"
  input: "Variable_13/Adam_1"
  input: "Variable_13/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_13/Adam_1/read"
  op: "Identity"
  input: "Variable_13/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
}
node {
  name: "Adam/beta1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "Adam/beta2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "Adam/epsilon"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.99999993922529e-09
      }
    }
  }
}
node {
  name: "Adam/update_Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable"
  input: "Variable/Adam"
  input: "Variable/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_1"
  input: "Variable_1/Adam"
  input: "Variable_1/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "bn/Variable"
  input: "bn/Variable/Adam"
  input: "bn/Variable/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "bn/Variable_1"
  input: "bn/Variable_1/Adam"
  input: "bn/Variable_1/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_2/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_2"
  input: "Variable_2/Adam"
  input: "Variable_2/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_3/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_3"
  input: "Variable_3/Adam"
  input: "Variable_3/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_1/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_1/Variable"
  input: "bn_1/Variable/Adam"
  input: "bn_1/Variable/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_1/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_1/Variable_1"
  input: "bn_1/Variable_1/Adam"
  input: "bn_1/Variable_1/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_4/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_4"
  input: "Variable_4/Adam"
  input: "Variable_4/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_5/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_5"
  input: "Variable_5/Adam"
  input: "Variable_5/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_2/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_2/Variable"
  input: "bn_2/Variable/Adam"
  input: "bn_2/Variable/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_2/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_2/Variable_1"
  input: "bn_2/Variable_1/Adam"
  input: "bn_2/Variable_1/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_6/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_6"
  input: "Variable_6/Adam"
  input: "Variable_6/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_7/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_7"
  input: "Variable_7/Adam"
  input: "Variable_7/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_3/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_3/Variable"
  input: "bn_3/Variable/Adam"
  input: "bn_3/Variable/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_3/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_3/Variable_1"
  input: "bn_3/Variable_1/Adam"
  input: "bn_3/Variable_1/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_8/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_8"
  input: "Variable_8/Adam"
  input: "Variable_8/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_9/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_9"
  input: "Variable_9/Adam"
  input: "Variable_9/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_4/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_4/Variable"
  input: "bn_4/Variable/Adam"
  input: "bn_4/Variable/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_4/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_4/Variable_1"
  input: "bn_4/Variable_1/Adam"
  input: "bn_4/Variable_1/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_10/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_10"
  input: "Variable_10/Adam"
  input: "Variable_10/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_11/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_11"
  input: "Variable_11/Adam"
  input: "Variable_11/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_5/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_5/Variable"
  input: "bn_5/Variable/Adam"
  input: "bn_5/Variable/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_bn_5/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "bn_5/Variable_1"
  input: "bn_5/Variable_1/Adam"
  input: "bn_5/Variable_1/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_12/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_12"
  input: "Variable_12/Adam"
  input: "Variable_12/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_13/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_13"
  input: "Variable_13/Adam"
  input: "Variable_13/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "clip_by_value_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/mul"
  op: "Mul"
  input: "beta1_power/read"
  input: "Adam/beta1"
  input: "^Adam/update_Variable/ApplyAdam"
  input: "^Adam/update_Variable_1/ApplyAdam"
  input: "^Adam/update_bn/Variable/ApplyAdam"
  input: "^Adam/update_bn/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_2/ApplyAdam"
  input: "^Adam/update_Variable_3/ApplyAdam"
  input: "^Adam/update_bn_1/Variable/ApplyAdam"
  input: "^Adam/update_bn_1/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_4/ApplyAdam"
  input: "^Adam/update_Variable_5/ApplyAdam"
  input: "^Adam/update_bn_2/Variable/ApplyAdam"
  input: "^Adam/update_bn_2/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_6/ApplyAdam"
  input: "^Adam/update_Variable_7/ApplyAdam"
  input: "^Adam/update_bn_3/Variable/ApplyAdam"
  input: "^Adam/update_bn_3/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_8/ApplyAdam"
  input: "^Adam/update_Variable_9/ApplyAdam"
  input: "^Adam/update_bn_4/Variable/ApplyAdam"
  input: "^Adam/update_bn_4/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_10/ApplyAdam"
  input: "^Adam/update_Variable_11/ApplyAdam"
  input: "^Adam/update_bn_5/Variable/ApplyAdam"
  input: "^Adam/update_bn_5/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_12/ApplyAdam"
  input: "^Adam/update_Variable_13/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Adam/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "Adam/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam/mul_1"
  op: "Mul"
  input: "beta2_power/read"
  input: "Adam/beta2"
  input: "^Adam/update_Variable/ApplyAdam"
  input: "^Adam/update_Variable_1/ApplyAdam"
  input: "^Adam/update_bn/Variable/ApplyAdam"
  input: "^Adam/update_bn/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_2/ApplyAdam"
  input: "^Adam/update_Variable_3/ApplyAdam"
  input: "^Adam/update_bn_1/Variable/ApplyAdam"
  input: "^Adam/update_bn_1/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_4/ApplyAdam"
  input: "^Adam/update_Variable_5/ApplyAdam"
  input: "^Adam/update_bn_2/Variable/ApplyAdam"
  input: "^Adam/update_bn_2/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_6/ApplyAdam"
  input: "^Adam/update_Variable_7/ApplyAdam"
  input: "^Adam/update_bn_3/Variable/ApplyAdam"
  input: "^Adam/update_bn_3/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_8/ApplyAdam"
  input: "^Adam/update_Variable_9/ApplyAdam"
  input: "^Adam/update_bn_4/Variable/ApplyAdam"
  input: "^Adam/update_bn_4/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_10/ApplyAdam"
  input: "^Adam/update_Variable_11/ApplyAdam"
  input: "^Adam/update_bn_5/Variable/ApplyAdam"
  input: "^Adam/update_bn_5/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_12/ApplyAdam"
  input: "^Adam/update_Variable_13/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Adam/Assign_1"
  op: "Assign"
  input: "beta2_power"
  input: "Adam/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam/update"
  op: "NoOp"
  input: "^Adam/update_Variable/ApplyAdam"
  input: "^Adam/update_Variable_1/ApplyAdam"
  input: "^Adam/update_bn/Variable/ApplyAdam"
  input: "^Adam/update_bn/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_2/ApplyAdam"
  input: "^Adam/update_Variable_3/ApplyAdam"
  input: "^Adam/update_bn_1/Variable/ApplyAdam"
  input: "^Adam/update_bn_1/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_4/ApplyAdam"
  input: "^Adam/update_Variable_5/ApplyAdam"
  input: "^Adam/update_bn_2/Variable/ApplyAdam"
  input: "^Adam/update_bn_2/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_6/ApplyAdam"
  input: "^Adam/update_Variable_7/ApplyAdam"
  input: "^Adam/update_bn_3/Variable/ApplyAdam"
  input: "^Adam/update_bn_3/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_8/ApplyAdam"
  input: "^Adam/update_Variable_9/ApplyAdam"
  input: "^Adam/update_bn_4/Variable/ApplyAdam"
  input: "^Adam/update_bn_4/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_10/ApplyAdam"
  input: "^Adam/update_Variable_11/ApplyAdam"
  input: "^Adam/update_bn_5/Variable/ApplyAdam"
  input: "^Adam/update_bn_5/Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_12/ApplyAdam"
  input: "^Adam/update_Variable_13/ApplyAdam"
  input: "^Adam/Assign"
  input: "^Adam/Assign_1"
}
node {
  name: "Adam/value"
  op: "Const"
  input: "^Adam/update"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Adam"
  op: "AssignAdd"
  input: "Variable_14"
  input: "Adam/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 93
          }
        }
        string_val: "Variable"
        string_val: "Variable/Adam"
        string_val: "Variable/Adam_1"
        string_val: "Variable_1"
        string_val: "Variable_1/Adam"
        string_val: "Variable_1/Adam_1"
        string_val: "Variable_10"
        string_val: "Variable_10/Adam"
        string_val: "Variable_10/Adam_1"
        string_val: "Variable_11"
        string_val: "Variable_11/Adam"
        string_val: "Variable_11/Adam_1"
        string_val: "Variable_12"
        string_val: "Variable_12/Adam"
        string_val: "Variable_12/Adam_1"
        string_val: "Variable_13"
        string_val: "Variable_13/Adam"
        string_val: "Variable_13/Adam_1"
        string_val: "Variable_14"
        string_val: "Variable_2"
        string_val: "Variable_2/Adam"
        string_val: "Variable_2/Adam_1"
        string_val: "Variable_3"
        string_val: "Variable_3/Adam"
        string_val: "Variable_3/Adam_1"
        string_val: "Variable_4"
        string_val: "Variable_4/Adam"
        string_val: "Variable_4/Adam_1"
        string_val: "Variable_5"
        string_val: "Variable_5/Adam"
        string_val: "Variable_5/Adam_1"
        string_val: "Variable_6"
        string_val: "Variable_6/Adam"
        string_val: "Variable_6/Adam_1"
        string_val: "Variable_7"
        string_val: "Variable_7/Adam"
        string_val: "Variable_7/Adam_1"
        string_val: "Variable_8"
        string_val: "Variable_8/Adam"
        string_val: "Variable_8/Adam_1"
        string_val: "Variable_9"
        string_val: "Variable_9/Adam"
        string_val: "Variable_9/Adam_1"
        string_val: "beta1_power"
        string_val: "beta2_power"
        string_val: "bn/Variable"
        string_val: "bn/Variable/Adam"
        string_val: "bn/Variable/Adam_1"
        string_val: "bn/Variable_1"
        string_val: "bn/Variable_1/Adam"
        string_val: "bn/Variable_1/Adam_1"
        string_val: "bn/bn/moments/Squeeze/ExponentialMovingAverage"
        string_val: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
        string_val: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
        string_val: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
        string_val: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
        string_val: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
        string_val: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
        string_val: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
        string_val: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
        string_val: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
        string_val: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
        string_val: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
        string_val: "bn_1/Variable"
        string_val: "bn_1/Variable/Adam"
        string_val: "bn_1/Variable/Adam_1"
        string_val: "bn_1/Variable_1"
        string_val: "bn_1/Variable_1/Adam"
        string_val: "bn_1/Variable_1/Adam_1"
        string_val: "bn_2/Variable"
        string_val: "bn_2/Variable/Adam"
        string_val: "bn_2/Variable/Adam_1"
        string_val: "bn_2/Variable_1"
        string_val: "bn_2/Variable_1/Adam"
        string_val: "bn_2/Variable_1/Adam_1"
        string_val: "bn_3/Variable"
        string_val: "bn_3/Variable/Adam"
        string_val: "bn_3/Variable/Adam_1"
        string_val: "bn_3/Variable_1"
        string_val: "bn_3/Variable_1/Adam"
        string_val: "bn_3/Variable_1/Adam_1"
        string_val: "bn_4/Variable"
        string_val: "bn_4/Variable/Adam"
        string_val: "bn_4/Variable/Adam_1"
        string_val: "bn_4/Variable_1"
        string_val: "bn_4/Variable_1/Adam"
        string_val: "bn_4/Variable_1/Adam_1"
        string_val: "bn_5/Variable"
        string_val: "bn_5/Variable/Adam"
        string_val: "bn_5/Variable/Adam_1"
        string_val: "bn_5/Variable_1"
        string_val: "bn_5/Variable_1/Adam"
        string_val: "bn_5/Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 93
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "Variable"
  input: "Variable/Adam"
  input: "Variable/Adam_1"
  input: "Variable_1"
  input: "Variable_1/Adam"
  input: "Variable_1/Adam_1"
  input: "Variable_10"
  input: "Variable_10/Adam"
  input: "Variable_10/Adam_1"
  input: "Variable_11"
  input: "Variable_11/Adam"
  input: "Variable_11/Adam_1"
  input: "Variable_12"
  input: "Variable_12/Adam"
  input: "Variable_12/Adam_1"
  input: "Variable_13"
  input: "Variable_13/Adam"
  input: "Variable_13/Adam_1"
  input: "Variable_14"
  input: "Variable_2"
  input: "Variable_2/Adam"
  input: "Variable_2/Adam_1"
  input: "Variable_3"
  input: "Variable_3/Adam"
  input: "Variable_3/Adam_1"
  input: "Variable_4"
  input: "Variable_4/Adam"
  input: "Variable_4/Adam_1"
  input: "Variable_5"
  input: "Variable_5/Adam"
  input: "Variable_5/Adam_1"
  input: "Variable_6"
  input: "Variable_6/Adam"
  input: "Variable_6/Adam_1"
  input: "Variable_7"
  input: "Variable_7/Adam"
  input: "Variable_7/Adam_1"
  input: "Variable_8"
  input: "Variable_8/Adam"
  input: "Variable_8/Adam_1"
  input: "Variable_9"
  input: "Variable_9/Adam"
  input: "Variable_9/Adam_1"
  input: "beta1_power"
  input: "beta2_power"
  input: "bn/Variable"
  input: "bn/Variable/Adam"
  input: "bn/Variable/Adam_1"
  input: "bn/Variable_1"
  input: "bn/Variable_1/Adam"
  input: "bn/Variable_1/Adam_1"
  input: "bn/bn/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
  input: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
  input: "bn_1/Variable"
  input: "bn_1/Variable/Adam"
  input: "bn_1/Variable/Adam_1"
  input: "bn_1/Variable_1"
  input: "bn_1/Variable_1/Adam"
  input: "bn_1/Variable_1/Adam_1"
  input: "bn_2/Variable"
  input: "bn_2/Variable/Adam"
  input: "bn_2/Variable/Adam_1"
  input: "bn_2/Variable_1"
  input: "bn_2/Variable_1/Adam"
  input: "bn_2/Variable_1/Adam_1"
  input: "bn_3/Variable"
  input: "bn_3/Variable/Adam"
  input: "bn_3/Variable/Adam_1"
  input: "bn_3/Variable_1"
  input: "bn_3/Variable_1/Adam"
  input: "bn_3/Variable_1/Adam_1"
  input: "bn_4/Variable"
  input: "bn_4/Variable/Adam"
  input: "bn_4/Variable/Adam_1"
  input: "bn_4/Variable_1"
  input: "bn_4/Variable_1/Adam"
  input: "bn_4/Variable_1/Adam_1"
  input: "bn_5/Variable"
  input: "bn_5/Variable/Adam"
  input: "bn_5/Variable/Adam_1"
  input: "bn_5/Variable_1"
  input: "bn_5/Variable_1/Adam"
  input: "bn_5/Variable_1/Adam_1"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "Variable"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_1/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_1/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_1"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_1/tensor_names"
  input: "save/RestoreV2_1/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "Variable/Adam"
  input: "save/RestoreV2_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_2/tensor_names"
  input: "save/RestoreV2_2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "Variable/Adam_1"
  input: "save/RestoreV2_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_3/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_3/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_3"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_3/tensor_names"
  input: "save/RestoreV2_3/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "Variable_1"
  input: "save/RestoreV2_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_4/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_1/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_4/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_4"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_4/tensor_names"
  input: "save/RestoreV2_4/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "Variable_1/Adam"
  input: "save/RestoreV2_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_5/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_5/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_5"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_5/tensor_names"
  input: "save/RestoreV2_5/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "Variable_1/Adam_1"
  input: "save/RestoreV2_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_6/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_10"
      }
    }
  }
}
node {
  name: "save/RestoreV2_6/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_6"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_6/tensor_names"
  input: "save/RestoreV2_6/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "Variable_10"
  input: "save/RestoreV2_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_7/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_10/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_7/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_7"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_7/tensor_names"
  input: "save/RestoreV2_7/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "Variable_10/Adam"
  input: "save/RestoreV2_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_8/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_10/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_8/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_8"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_8/tensor_names"
  input: "save/RestoreV2_8/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "Variable_10/Adam_1"
  input: "save/RestoreV2_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_9/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_11"
      }
    }
  }
}
node {
  name: "save/RestoreV2_9/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_9"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_9/tensor_names"
  input: "save/RestoreV2_9/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "Variable_11"
  input: "save/RestoreV2_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_10/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_11/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_10/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_10"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_10/tensor_names"
  input: "save/RestoreV2_10/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "Variable_11/Adam"
  input: "save/RestoreV2_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_11/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_11/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_11/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_11"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_11/tensor_names"
  input: "save/RestoreV2_11/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "Variable_11/Adam_1"
  input: "save/RestoreV2_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_12/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_12"
      }
    }
  }
}
node {
  name: "save/RestoreV2_12/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_12"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_12/tensor_names"
  input: "save/RestoreV2_12/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "Variable_12"
  input: "save/RestoreV2_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_13/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_12/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_13/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_13"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_13/tensor_names"
  input: "save/RestoreV2_13/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "Variable_12/Adam"
  input: "save/RestoreV2_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_14/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_12/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_14/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_14"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_14/tensor_names"
  input: "save/RestoreV2_14/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "Variable_12/Adam_1"
  input: "save/RestoreV2_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_15/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_13"
      }
    }
  }
}
node {
  name: "save/RestoreV2_15/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_15"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_15/tensor_names"
  input: "save/RestoreV2_15/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "Variable_13"
  input: "save/RestoreV2_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_16/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_13/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_16/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_16"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_16/tensor_names"
  input: "save/RestoreV2_16/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "Variable_13/Adam"
  input: "save/RestoreV2_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_17/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_13/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_17/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_17"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_17/tensor_names"
  input: "save/RestoreV2_17/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "Variable_13/Adam_1"
  input: "save/RestoreV2_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_18/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_14"
      }
    }
  }
}
node {
  name: "save/RestoreV2_18/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_18"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_18/tensor_names"
  input: "save/RestoreV2_18/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_INT32
      }
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "Variable_14"
  input: "save/RestoreV2_18"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_19/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_2"
      }
    }
  }
}
node {
  name: "save/RestoreV2_19/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_19"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_19/tensor_names"
  input: "save/RestoreV2_19/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "Variable_2"
  input: "save/RestoreV2_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_20/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_2/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_20/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_20"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_20/tensor_names"
  input: "save/RestoreV2_20/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "Variable_2/Adam"
  input: "save/RestoreV2_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_21/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_2/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_21/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_21"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_21/tensor_names"
  input: "save/RestoreV2_21/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "Variable_2/Adam_1"
  input: "save/RestoreV2_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_22/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_3"
      }
    }
  }
}
node {
  name: "save/RestoreV2_22/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_22"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_22/tensor_names"
  input: "save/RestoreV2_22/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "Variable_3"
  input: "save/RestoreV2_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_23/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_3/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_23/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_23"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_23/tensor_names"
  input: "save/RestoreV2_23/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "Variable_3/Adam"
  input: "save/RestoreV2_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_24/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_3/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_24/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_24"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_24/tensor_names"
  input: "save/RestoreV2_24/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "Variable_3/Adam_1"
  input: "save/RestoreV2_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_25/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_4"
      }
    }
  }
}
node {
  name: "save/RestoreV2_25/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_25"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_25/tensor_names"
  input: "save/RestoreV2_25/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "Variable_4"
  input: "save/RestoreV2_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_26/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_4/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_26/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_26"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_26/tensor_names"
  input: "save/RestoreV2_26/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_26"
  op: "Assign"
  input: "Variable_4/Adam"
  input: "save/RestoreV2_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_27/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_4/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_27/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_27"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_27/tensor_names"
  input: "save/RestoreV2_27/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_27"
  op: "Assign"
  input: "Variable_4/Adam_1"
  input: "save/RestoreV2_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_28/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_5"
      }
    }
  }
}
node {
  name: "save/RestoreV2_28/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_28"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_28/tensor_names"
  input: "save/RestoreV2_28/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_28"
  op: "Assign"
  input: "Variable_5"
  input: "save/RestoreV2_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_29/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_5/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_29/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_29"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_29/tensor_names"
  input: "save/RestoreV2_29/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_29"
  op: "Assign"
  input: "Variable_5/Adam"
  input: "save/RestoreV2_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_30/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_5/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_30/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_30"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_30/tensor_names"
  input: "save/RestoreV2_30/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_30"
  op: "Assign"
  input: "Variable_5/Adam_1"
  input: "save/RestoreV2_30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_31/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_6"
      }
    }
  }
}
node {
  name: "save/RestoreV2_31/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_31"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_31/tensor_names"
  input: "save/RestoreV2_31/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_31"
  op: "Assign"
  input: "Variable_6"
  input: "save/RestoreV2_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_32/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_6/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_32/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_32"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_32/tensor_names"
  input: "save/RestoreV2_32/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_32"
  op: "Assign"
  input: "Variable_6/Adam"
  input: "save/RestoreV2_32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_33/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_6/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_33/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_33"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_33/tensor_names"
  input: "save/RestoreV2_33/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_33"
  op: "Assign"
  input: "Variable_6/Adam_1"
  input: "save/RestoreV2_33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_34/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_7"
      }
    }
  }
}
node {
  name: "save/RestoreV2_34/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_34"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_34/tensor_names"
  input: "save/RestoreV2_34/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_34"
  op: "Assign"
  input: "Variable_7"
  input: "save/RestoreV2_34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_35/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_7/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_35/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_35"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_35/tensor_names"
  input: "save/RestoreV2_35/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_35"
  op: "Assign"
  input: "Variable_7/Adam"
  input: "save/RestoreV2_35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_36/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_7/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_36/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_36"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_36/tensor_names"
  input: "save/RestoreV2_36/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_36"
  op: "Assign"
  input: "Variable_7/Adam_1"
  input: "save/RestoreV2_36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_37/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_8"
      }
    }
  }
}
node {
  name: "save/RestoreV2_37/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_37"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_37/tensor_names"
  input: "save/RestoreV2_37/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_37"
  op: "Assign"
  input: "Variable_8"
  input: "save/RestoreV2_37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_38/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_8/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_38/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_38"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_38/tensor_names"
  input: "save/RestoreV2_38/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_38"
  op: "Assign"
  input: "Variable_8/Adam"
  input: "save/RestoreV2_38"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_39/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_8/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_39/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_39"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_39/tensor_names"
  input: "save/RestoreV2_39/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_39"
  op: "Assign"
  input: "Variable_8/Adam_1"
  input: "save/RestoreV2_39"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_40/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_9"
      }
    }
  }
}
node {
  name: "save/RestoreV2_40/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_40"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_40/tensor_names"
  input: "save/RestoreV2_40/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_40"
  op: "Assign"
  input: "Variable_9"
  input: "save/RestoreV2_40"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_41/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_9/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_41/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_41"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_41/tensor_names"
  input: "save/RestoreV2_41/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_41"
  op: "Assign"
  input: "Variable_9/Adam"
  input: "save/RestoreV2_41"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_42/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_9/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_42/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_42"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_42/tensor_names"
  input: "save/RestoreV2_42/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_42"
  op: "Assign"
  input: "Variable_9/Adam_1"
  input: "save/RestoreV2_42"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_43/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "beta1_power"
      }
    }
  }
}
node {
  name: "save/RestoreV2_43/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_43"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_43/tensor_names"
  input: "save/RestoreV2_43/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_43"
  op: "Assign"
  input: "beta1_power"
  input: "save/RestoreV2_43"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_44/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "beta2_power"
      }
    }
  }
}
node {
  name: "save/RestoreV2_44/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_44"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_44/tensor_names"
  input: "save/RestoreV2_44/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_44"
  op: "Assign"
  input: "beta2_power"
  input: "save/RestoreV2_44"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_45/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2_45/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_45"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_45/tensor_names"
  input: "save/RestoreV2_45/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_45"
  op: "Assign"
  input: "bn/Variable"
  input: "save/RestoreV2_45"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_46/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/Variable/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_46/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_46"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_46/tensor_names"
  input: "save/RestoreV2_46/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_46"
  op: "Assign"
  input: "bn/Variable/Adam"
  input: "save/RestoreV2_46"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_47/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/Variable/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_47/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_47"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_47/tensor_names"
  input: "save/RestoreV2_47/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_47"
  op: "Assign"
  input: "bn/Variable/Adam_1"
  input: "save/RestoreV2_47"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_48/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/Variable_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_48/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_48"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_48/tensor_names"
  input: "save/RestoreV2_48/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_48"
  op: "Assign"
  input: "bn/Variable_1"
  input: "save/RestoreV2_48"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_49/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/Variable_1/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_49/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_49"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_49/tensor_names"
  input: "save/RestoreV2_49/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_49"
  op: "Assign"
  input: "bn/Variable_1/Adam"
  input: "save/RestoreV2_49"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_50/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_50/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_50"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_50/tensor_names"
  input: "save/RestoreV2_50/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_50"
  op: "Assign"
  input: "bn/Variable_1/Adam_1"
  input: "save/RestoreV2_50"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_51/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_51/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_51"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_51/tensor_names"
  input: "save/RestoreV2_51/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_51"
  op: "Assign"
  input: "bn/bn/moments/Squeeze/ExponentialMovingAverage"
  input: "save/RestoreV2_51"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_52/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_52/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_52"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_52/tensor_names"
  input: "save/RestoreV2_52/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_52"
  op: "Assign"
  input: "bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
  input: "save/RestoreV2_52"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_53/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_53/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_53"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_53/tensor_names"
  input: "save/RestoreV2_53/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_53"
  op: "Assign"
  input: "bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
  input: "save/RestoreV2_53"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_54/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_54/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_54"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_54/tensor_names"
  input: "save/RestoreV2_54/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_54"
  op: "Assign"
  input: "bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
  input: "save/RestoreV2_54"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_55/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_55/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_55"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_55/tensor_names"
  input: "save/RestoreV2_55/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_55"
  op: "Assign"
  input: "bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
  input: "save/RestoreV2_55"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_56/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_56/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_56"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_56/tensor_names"
  input: "save/RestoreV2_56/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_56"
  op: "Assign"
  input: "bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
  input: "save/RestoreV2_56"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_57/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_57/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_57"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_57/tensor_names"
  input: "save/RestoreV2_57/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_57"
  op: "Assign"
  input: "bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
  input: "save/RestoreV2_57"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_58/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_58/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_58"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_58/tensor_names"
  input: "save/RestoreV2_58/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_58"
  op: "Assign"
  input: "bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
  input: "save/RestoreV2_58"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_59/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_59/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_59"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_59/tensor_names"
  input: "save/RestoreV2_59/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_59"
  op: "Assign"
  input: "bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
  input: "save/RestoreV2_59"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_60/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_60/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_60"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_60/tensor_names"
  input: "save/RestoreV2_60/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_60"
  op: "Assign"
  input: "bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
  input: "save/RestoreV2_60"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_61/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_61/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_61"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_61/tensor_names"
  input: "save/RestoreV2_61/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_61"
  op: "Assign"
  input: "bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
  input: "save/RestoreV2_61"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_62/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
}
node {
  name: "save/RestoreV2_62/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_62"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_62/tensor_names"
  input: "save/RestoreV2_62/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_62"
  op: "Assign"
  input: "bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
  input: "save/RestoreV2_62"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_63/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_1/Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2_63/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_63"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_63/tensor_names"
  input: "save/RestoreV2_63/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_63"
  op: "Assign"
  input: "bn_1/Variable"
  input: "save/RestoreV2_63"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_64/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_1/Variable/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_64/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_64"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_64/tensor_names"
  input: "save/RestoreV2_64/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_64"
  op: "Assign"
  input: "bn_1/Variable/Adam"
  input: "save/RestoreV2_64"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_65/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_1/Variable/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_65/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_65"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_65/tensor_names"
  input: "save/RestoreV2_65/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_65"
  op: "Assign"
  input: "bn_1/Variable/Adam_1"
  input: "save/RestoreV2_65"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_66/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_1/Variable_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_66/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_66"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_66/tensor_names"
  input: "save/RestoreV2_66/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_66"
  op: "Assign"
  input: "bn_1/Variable_1"
  input: "save/RestoreV2_66"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_67/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_1/Variable_1/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_67/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_67"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_67/tensor_names"
  input: "save/RestoreV2_67/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_67"
  op: "Assign"
  input: "bn_1/Variable_1/Adam"
  input: "save/RestoreV2_67"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_68/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_1/Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_68/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_68"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_68/tensor_names"
  input: "save/RestoreV2_68/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_68"
  op: "Assign"
  input: "bn_1/Variable_1/Adam_1"
  input: "save/RestoreV2_68"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_69/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_2/Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2_69/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_69"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_69/tensor_names"
  input: "save/RestoreV2_69/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_69"
  op: "Assign"
  input: "bn_2/Variable"
  input: "save/RestoreV2_69"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_70/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_2/Variable/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_70/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_70"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_70/tensor_names"
  input: "save/RestoreV2_70/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_70"
  op: "Assign"
  input: "bn_2/Variable/Adam"
  input: "save/RestoreV2_70"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_71/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_2/Variable/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_71/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_71"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_71/tensor_names"
  input: "save/RestoreV2_71/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_71"
  op: "Assign"
  input: "bn_2/Variable/Adam_1"
  input: "save/RestoreV2_71"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_72/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_2/Variable_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_72/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_72"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_72/tensor_names"
  input: "save/RestoreV2_72/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_72"
  op: "Assign"
  input: "bn_2/Variable_1"
  input: "save/RestoreV2_72"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_73/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_2/Variable_1/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_73/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_73"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_73/tensor_names"
  input: "save/RestoreV2_73/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_73"
  op: "Assign"
  input: "bn_2/Variable_1/Adam"
  input: "save/RestoreV2_73"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_74/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_2/Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_74/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_74"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_74/tensor_names"
  input: "save/RestoreV2_74/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_74"
  op: "Assign"
  input: "bn_2/Variable_1/Adam_1"
  input: "save/RestoreV2_74"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_75/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_3/Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2_75/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_75"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_75/tensor_names"
  input: "save/RestoreV2_75/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_75"
  op: "Assign"
  input: "bn_3/Variable"
  input: "save/RestoreV2_75"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_76/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_3/Variable/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_76/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_76"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_76/tensor_names"
  input: "save/RestoreV2_76/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_76"
  op: "Assign"
  input: "bn_3/Variable/Adam"
  input: "save/RestoreV2_76"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_77/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_3/Variable/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_77/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_77"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_77/tensor_names"
  input: "save/RestoreV2_77/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_77"
  op: "Assign"
  input: "bn_3/Variable/Adam_1"
  input: "save/RestoreV2_77"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_78/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_3/Variable_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_78/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_78"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_78/tensor_names"
  input: "save/RestoreV2_78/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_78"
  op: "Assign"
  input: "bn_3/Variable_1"
  input: "save/RestoreV2_78"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_79/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_3/Variable_1/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_79/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_79"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_79/tensor_names"
  input: "save/RestoreV2_79/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_79"
  op: "Assign"
  input: "bn_3/Variable_1/Adam"
  input: "save/RestoreV2_79"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_80/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_3/Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_80/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_80"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_80/tensor_names"
  input: "save/RestoreV2_80/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_80"
  op: "Assign"
  input: "bn_3/Variable_1/Adam_1"
  input: "save/RestoreV2_80"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_3/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_81/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_4/Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2_81/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_81"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_81/tensor_names"
  input: "save/RestoreV2_81/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_81"
  op: "Assign"
  input: "bn_4/Variable"
  input: "save/RestoreV2_81"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_82/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_4/Variable/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_82/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_82"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_82/tensor_names"
  input: "save/RestoreV2_82/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_82"
  op: "Assign"
  input: "bn_4/Variable/Adam"
  input: "save/RestoreV2_82"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_83/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_4/Variable/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_83/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_83"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_83/tensor_names"
  input: "save/RestoreV2_83/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_83"
  op: "Assign"
  input: "bn_4/Variable/Adam_1"
  input: "save/RestoreV2_83"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_84/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_4/Variable_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_84/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_84"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_84/tensor_names"
  input: "save/RestoreV2_84/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_84"
  op: "Assign"
  input: "bn_4/Variable_1"
  input: "save/RestoreV2_84"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_85/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_4/Variable_1/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_85/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_85"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_85/tensor_names"
  input: "save/RestoreV2_85/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_85"
  op: "Assign"
  input: "bn_4/Variable_1/Adam"
  input: "save/RestoreV2_85"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_86/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_4/Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_86/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_86"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_86/tensor_names"
  input: "save/RestoreV2_86/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_86"
  op: "Assign"
  input: "bn_4/Variable_1/Adam_1"
  input: "save/RestoreV2_86"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_4/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_87/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_5/Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2_87/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_87"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_87/tensor_names"
  input: "save/RestoreV2_87/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_87"
  op: "Assign"
  input: "bn_5/Variable"
  input: "save/RestoreV2_87"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_88/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_5/Variable/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_88/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_88"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_88/tensor_names"
  input: "save/RestoreV2_88/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_88"
  op: "Assign"
  input: "bn_5/Variable/Adam"
  input: "save/RestoreV2_88"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_89/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_5/Variable/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_89/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_89"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_89/tensor_names"
  input: "save/RestoreV2_89/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_89"
  op: "Assign"
  input: "bn_5/Variable/Adam_1"
  input: "save/RestoreV2_89"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_90/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_5/Variable_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_90/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_90"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_90/tensor_names"
  input: "save/RestoreV2_90/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_90"
  op: "Assign"
  input: "bn_5/Variable_1"
  input: "save/RestoreV2_90"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_91/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_5/Variable_1/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_91/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_91"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_91/tensor_names"
  input: "save/RestoreV2_91/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_91"
  op: "Assign"
  input: "bn_5/Variable_1/Adam"
  input: "save/RestoreV2_91"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_92/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bn_5/Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_92/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_92"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_92/tensor_names"
  input: "save/RestoreV2_92/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_92"
  op: "Assign"
  input: "bn_5/Variable_1/Adam_1"
  input: "save/RestoreV2_92"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bn_5/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
  input: "^save/Assign_27"
  input: "^save/Assign_28"
  input: "^save/Assign_29"
  input: "^save/Assign_30"
  input: "^save/Assign_31"
  input: "^save/Assign_32"
  input: "^save/Assign_33"
  input: "^save/Assign_34"
  input: "^save/Assign_35"
  input: "^save/Assign_36"
  input: "^save/Assign_37"
  input: "^save/Assign_38"
  input: "^save/Assign_39"
  input: "^save/Assign_40"
  input: "^save/Assign_41"
  input: "^save/Assign_42"
  input: "^save/Assign_43"
  input: "^save/Assign_44"
  input: "^save/Assign_45"
  input: "^save/Assign_46"
  input: "^save/Assign_47"
  input: "^save/Assign_48"
  input: "^save/Assign_49"
  input: "^save/Assign_50"
  input: "^save/Assign_51"
  input: "^save/Assign_52"
  input: "^save/Assign_53"
  input: "^save/Assign_54"
  input: "^save/Assign_55"
  input: "^save/Assign_56"
  input: "^save/Assign_57"
  input: "^save/Assign_58"
  input: "^save/Assign_59"
  input: "^save/Assign_60"
  input: "^save/Assign_61"
  input: "^save/Assign_62"
  input: "^save/Assign_63"
  input: "^save/Assign_64"
  input: "^save/Assign_65"
  input: "^save/Assign_66"
  input: "^save/Assign_67"
  input: "^save/Assign_68"
  input: "^save/Assign_69"
  input: "^save/Assign_70"
  input: "^save/Assign_71"
  input: "^save/Assign_72"
  input: "^save/Assign_73"
  input: "^save/Assign_74"
  input: "^save/Assign_75"
  input: "^save/Assign_76"
  input: "^save/Assign_77"
  input: "^save/Assign_78"
  input: "^save/Assign_79"
  input: "^save/Assign_80"
  input: "^save/Assign_81"
  input: "^save/Assign_82"
  input: "^save/Assign_83"
  input: "^save/Assign_84"
  input: "^save/Assign_85"
  input: "^save/Assign_86"
  input: "^save/Assign_87"
  input: "^save/Assign_88"
  input: "^save/Assign_89"
  input: "^save/Assign_90"
  input: "^save/Assign_91"
  input: "^save/Assign_92"
}
node {
  name: "init"
  op: "NoOp"
  input: "^Variable/Assign"
  input: "^Variable_1/Assign"
  input: "^bn/Variable/Assign"
  input: "^bn/Variable_1/Assign"
  input: "^bn/bn/moments/Squeeze/ExponentialMovingAverage/Assign"
  input: "^bn/bn/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  input: "^Variable_2/Assign"
  input: "^Variable_3/Assign"
  input: "^bn_1/Variable/Assign"
  input: "^bn_1/Variable_1/Assign"
  input: "^bn/bn_1/moments/Squeeze/ExponentialMovingAverage/Assign"
  input: "^bn/bn_1/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  input: "^Variable_4/Assign"
  input: "^Variable_5/Assign"
  input: "^bn_2/Variable/Assign"
  input: "^bn_2/Variable_1/Assign"
  input: "^bn/bn_2/moments/Squeeze/ExponentialMovingAverage/Assign"
  input: "^bn/bn_2/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  input: "^Variable_6/Assign"
  input: "^Variable_7/Assign"
  input: "^bn_3/Variable/Assign"
  input: "^bn_3/Variable_1/Assign"
  input: "^bn/bn_3/moments/Squeeze/ExponentialMovingAverage/Assign"
  input: "^bn/bn_3/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  input: "^Variable_8/Assign"
  input: "^Variable_9/Assign"
  input: "^bn_4/Variable/Assign"
  input: "^bn_4/Variable_1/Assign"
  input: "^bn/bn_4/moments/Squeeze/ExponentialMovingAverage/Assign"
  input: "^bn/bn_4/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  input: "^Variable_10/Assign"
  input: "^Variable_11/Assign"
  input: "^bn_5/Variable/Assign"
  input: "^bn_5/Variable_1/Assign"
  input: "^bn/bn_5/moments/Squeeze/ExponentialMovingAverage/Assign"
  input: "^bn/bn_5/moments/Squeeze_1/ExponentialMovingAverage/Assign"
  input: "^Variable_12/Assign"
  input: "^Variable_13/Assign"
  input: "^Variable_14/Assign"
  input: "^beta1_power/Assign"
  input: "^beta2_power/Assign"
  input: "^Variable/Adam/Assign"
  input: "^Variable/Adam_1/Assign"
  input: "^Variable_1/Adam/Assign"
  input: "^Variable_1/Adam_1/Assign"
  input: "^bn/Variable/Adam/Assign"
  input: "^bn/Variable/Adam_1/Assign"
  input: "^bn/Variable_1/Adam/Assign"
  input: "^bn/Variable_1/Adam_1/Assign"
  input: "^Variable_2/Adam/Assign"
  input: "^Variable_2/Adam_1/Assign"
  input: "^Variable_3/Adam/Assign"
  input: "^Variable_3/Adam_1/Assign"
  input: "^bn_1/Variable/Adam/Assign"
  input: "^bn_1/Variable/Adam_1/Assign"
  input: "^bn_1/Variable_1/Adam/Assign"
  input: "^bn_1/Variable_1/Adam_1/Assign"
  input: "^Variable_4/Adam/Assign"
  input: "^Variable_4/Adam_1/Assign"
  input: "^Variable_5/Adam/Assign"
  input: "^Variable_5/Adam_1/Assign"
  input: "^bn_2/Variable/Adam/Assign"
  input: "^bn_2/Variable/Adam_1/Assign"
  input: "^bn_2/Variable_1/Adam/Assign"
  input: "^bn_2/Variable_1/Adam_1/Assign"
  input: "^Variable_6/Adam/Assign"
  input: "^Variable_6/Adam_1/Assign"
  input: "^Variable_7/Adam/Assign"
  input: "^Variable_7/Adam_1/Assign"
  input: "^bn_3/Variable/Adam/Assign"
  input: "^bn_3/Variable/Adam_1/Assign"
  input: "^bn_3/Variable_1/Adam/Assign"
  input: "^bn_3/Variable_1/Adam_1/Assign"
  input: "^Variable_8/Adam/Assign"
  input: "^Variable_8/Adam_1/Assign"
  input: "^Variable_9/Adam/Assign"
  input: "^Variable_9/Adam_1/Assign"
  input: "^bn_4/Variable/Adam/Assign"
  input: "^bn_4/Variable/Adam_1/Assign"
  input: "^bn_4/Variable_1/Adam/Assign"
  input: "^bn_4/Variable_1/Adam_1/Assign"
  input: "^Variable_10/Adam/Assign"
  input: "^Variable_10/Adam_1/Assign"
  input: "^Variable_11/Adam/Assign"
  input: "^Variable_11/Adam_1/Assign"
  input: "^bn_5/Variable/Adam/Assign"
  input: "^bn_5/Variable/Adam_1/Assign"
  input: "^bn_5/Variable_1/Adam/Assign"
  input: "^bn_5/Variable_1/Adam_1/Assign"
  input: "^Variable_12/Adam/Assign"
  input: "^Variable_12/Adam_1/Assign"
  input: "^Variable_13/Adam/Assign"
  input: "^Variable_13/Adam_1/Assign"
}
versions {
  producer: 22
}
