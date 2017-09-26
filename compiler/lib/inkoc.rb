# frozen_string_literal: true

require 'sxdg'
require 'ansi'
require 'set'
require 'pathname'
require 'digest/sha1'

require 'inkoc/inspect'
require 'inkoc/source_file'
require 'inkoc/source_location'
require 'inkoc/token'
require 'inkoc/lexer'
require 'inkoc/parser'
require 'inkoc/module_paths_cache'
require 'inkoc/visitor_methods'
require 'inkoc/ast/predicates'
require 'inkoc/ast/body'
require 'inkoc/ast/send'
require 'inkoc/ast/constant'
require 'inkoc/ast/global'
require 'inkoc/ast/keyword_argument'
require 'inkoc/ast/string'
require 'inkoc/ast/integer'
require 'inkoc/ast/float'
require 'inkoc/ast/identifier'
require 'inkoc/ast/block'
require 'inkoc/ast/method'
require 'inkoc/ast/define_argument'
require 'inkoc/ast/define_type_parameter'
require 'inkoc/ast/pair'
require 'inkoc/ast/define_variable'
require 'inkoc/ast/attribute'
require 'inkoc/ast/object'
require 'inkoc/ast/implement'
require 'inkoc/ast/trait'
require 'inkoc/ast/return'
require 'inkoc/ast/throw'
require 'inkoc/ast/reassign_variable'
require 'inkoc/ast/self'
require 'inkoc/ast/try'
require 'inkoc/ast/import'
require 'inkoc/ast/import_symbol'
require 'inkoc/ast/glob_import'
require 'inkoc/ast/compiler_option'
require 'inkoc/config'
require 'inkoc/state'
require 'inkoc/type_verification'
require 'inkoc/type_inference'
require 'inkoc/diagnostics'
require 'inkoc/diagnostic'
require 'inkoc/symbol'
require 'inkoc/symbol_table'
require 'inkoc/formatter/pretty'
require 'inkoc/type_lookup'
require 'inkoc/define_type_parameters'
require 'inkoc/pass/path_to_source'
require 'inkoc/pass/source_to_ast'
require 'inkoc/pass/insert_implicit_imports'
require 'inkoc/pass/track_module'
require 'inkoc/pass/compile_imported_modules'
require 'inkoc/pass/define_types'
require 'inkoc/pass/generate_tir'
require 'inkoc/pass/configure_module'
require 'inkoc/pass/code_generation'
require 'inkoc/pass/code_writer'
require 'inkoc/pass/collect_imports'
require 'inkoc/pass/hoisting'
require 'inkoc/pass/dead_code'
require 'inkoc/compiler'
require 'inkoc/tir/module_config'
require 'inkoc/tir/builder'
require 'inkoc/tir/code_object'
require 'inkoc/tir/basic_block'
require 'inkoc/tir/instruction/predicates'
require 'inkoc/tir/instruction/get_array_prototype'
require 'inkoc/tir/instruction/get_attribute'
require 'inkoc/tir/instruction/get_block_prototype'
require 'inkoc/tir/instruction/get_boolean_prototype'
require 'inkoc/tir/instruction/get_float_prototype'
require 'inkoc/tir/instruction/get_global'
require 'inkoc/tir/instruction/get_integer_prototype'
require 'inkoc/tir/instruction/get_local'
require 'inkoc/tir/instruction/get_nil'
require 'inkoc/tir/instruction/get_string_prototype'
require 'inkoc/tir/instruction/get_toplevel'
require 'inkoc/tir/instruction/get_true'
require 'inkoc/tir/instruction/goto_next_block_if_true'
require 'inkoc/tir/instruction/load_module'
require 'inkoc/tir/instruction/local_exists'
require 'inkoc/tir/instruction/return'
require 'inkoc/tir/instruction/run_block'
require 'inkoc/tir/instruction/send_object_message'
require 'inkoc/tir/instruction/set_array'
require 'inkoc/tir/instruction/set_attribute'
require 'inkoc/tir/instruction/set_block'
require 'inkoc/tir/instruction/set_float'
require 'inkoc/tir/instruction/set_global'
require 'inkoc/tir/instruction/set_hash_map'
require 'inkoc/tir/instruction/set_integer'
require 'inkoc/tir/instruction/set_local'
require 'inkoc/tir/instruction/set_object'
require 'inkoc/tir/instruction/set_string'
require 'inkoc/tir/instruction/throw'
require 'inkoc/tir/instruction/try'
require 'inkoc/tir/instruction/integer_to_string'
require 'inkoc/tir/instruction/stdout_write'
require 'inkoc/tir/module'
require 'inkoc/tir/qualified_name'
require 'inkoc/tir/virtual_register'
require 'inkoc/tir/virtual_registers'
require 'inkoc/type/object_operations'
require 'inkoc/type/generic_type_operations'
require 'inkoc/type/type_compatibility'
require 'inkoc/type/immutable_type'
require 'inkoc/type/object'
require 'inkoc/type/block'
require 'inkoc/type/required_method'
require 'inkoc/type/boolean'
require 'inkoc/type/database'
require 'inkoc/type/dynamic'
require 'inkoc/type/float'
require 'inkoc/type/integer'
require 'inkoc/type/nil'
require 'inkoc/type/string'
require 'inkoc/type/trait'
require 'inkoc/type/type_parameter'
require 'inkoc/type/optional'
require 'inkoc/codegen/compiled_code'
require 'inkoc/codegen/instruction'
require 'inkoc/codegen/literals'
require 'inkoc/codegen/serializer'
