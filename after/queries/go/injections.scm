; extends

(
  (call_expression
    function: (selector_expression
      field: (field_identifier) @_method_name
        (#match? @_method_name "^(ExecOneContext|QueryOneContext|ExecContext|QueryContext|Exec|ExecOne|Query|QueryOne)$")
    )
    arguments: (argument_list
      (raw_string_literal
        (raw_string_literal_content) @injection.content
        (#set! injection.language "sql")
      )
    )
  )
)
