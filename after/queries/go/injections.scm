;extends

(
  (call_expression
    function: (selector_expression
      field: (field_identifier) @method_name
        (#match? @method_name "^(ExecContext|QueryContext|Exec|Query|ExecOne|ExecOneContext|QueryOne|QueryOneContext)$")
    )
    arguments: (argument_list
      (raw_string_literal) @injection.content
        (#set! injection.language "sql")
    )
  )
)
